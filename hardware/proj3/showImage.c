#include "xparameters.h"
#include "xaxivdma.h"
#include "xscugic.h"
#include "sleep.h"
#include <stdlib.h>
#include "xil_cache.h"
#include "imageData.h"

#define HSize 1920
#define VSize 1080
#define FrameSize HSize*VSize*3

static XScuGic Intc;

static int SetupIntrSystem(XAxiVdma *AxiVdmaPtr, u16 ReadIntrId);
int drawImage(u32 displayHSize, u32 displayVSize, char *imagePointer);

unsigned char Buffer[FrameSize];

int main() {
    int status;
    u32 Addr;
    XAxiVdma myVDMA;
    XAxiVdma_Config *config = XAxiVdma_LookupConfig(XPAR_AXI_VDMA_0_DEVICE_ID);
    XAxiVdma_DmaSetup ReadCfg;

    status = XAxiVdma_CfgInitialize(&myVDMA, config, config->BaseAddress);
    if (status != XST_SUCCESS) {
        xil_printf("DMA Initialization failed\n");
        return status;
    }

    ReadCfg.VertSizeInput = VSize;
    ReadCfg.HoriSizeInput = HSize * 3;
    ReadCfg.Stride = HSize * 3;
    ReadCfg.FrameDelay = 0;
    ReadCfg.EnableCircularBuf = 1;
    ReadCfg.EnableSync = 1;
    ReadCfg.PointNum = 0;
    ReadCfg.EnableFrameCounter = 0;
    ReadCfg.FixedFrameStoreAddr = 0;

    status = XAxiVdma_DmaConfig(&myVDMA, XAXIVDMA_READ, &ReadCfg);
    if (status != XST_SUCCESS) {
        xil_printf("Write channel config failed %d\r\n", status);
        return status;
    }

    Addr = (u32)&(Buffer[0]);
    for (int Index = 0; Index < myVDMA.MaxNumFrames; Index++) {
        ReadCfg.FrameStoreStartAddr[Index] = Addr;
        Addr += FrameSize;
    }

    status = XAxiVdma_DmaSetBufferAddr(&myVDMA, XAXIVDMA_READ, ReadCfg.FrameStoreStartAddr);
    if (status != XST_SUCCESS) {
        xil_printf("Read channel set buffer address failed %d\r\n", status);
        return XST_FAILURE;
    }

    XAxiVdma_IntrEnable(&myVDMA, XAXIVDMA_IXR_COMPLETION_MASK, XAXIVDMA_READ);
    SetupIntrSystem(&myVDMA, XPAR_FABRIC_AXI_VDMA_0_MM2S_INTROUT_INTR);

    // Draw the image
    drawImage(HSize, VSize, imageData);

    status = XAxiVdma_DmaStart(&myVDMA, XAXIVDMA_READ);
    if (status != XST_SUCCESS) {
        if (status == XST_VDMA_MISMATCH_ERROR)
            xil_printf("DMA Mismatch Error\n");
        return XST_FAILURE;
    }

    while (1) {
        // Infinite loop
    }
}

/*****************************************************************************/
/* Call back function for read channel                                      */
/*****************************************************************************/
static void ReadCallBack(void *CallbackRef, u32 Mask) {
    xil_printf("Read Call back function is called\n");
}

/*****************************************************************************/
/* Error callback function                                                  */
/*****************************************************************************/
static void ReadErrorCallBack(void *CallbackRef, u32 Mask) {
    xil_printf("Read Call back Error function is called\n");
}

static int SetupIntrSystem(XAxiVdma *AxiVdmaPtr, u16 ReadIntrId) {
    int Status;
    XScuGic *IntcInstancePtr = &Intc;

    XScuGic_Config *IntcConfig;
    IntcConfig = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
    Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig, IntcConfig->CpuBaseAddress);
    if (Status != XST_SUCCESS) {
        xil_printf("Interrupt controller initialization failed..\n");
        return -1;
    }

    Status = XScuGic_Connect(IntcInstancePtr, ReadIntrId, (Xil_InterruptHandler)XAxiVdma_ReadIntrHandler, (void *)AxiVdmaPtr);
    if (Status != XST_SUCCESS) {
        xil_printf("Failed read channel connect intc %d\r\n", Status);
        return XST_FAILURE;
    }

    XScuGic_Enable(IntcInstancePtr, ReadIntrId);

    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, (void *)IntcInstancePtr);
    Xil_ExceptionEnable();

    XAxiVdma_SetCallBack(AxiVdmaPtr, XAXIVDMA_HANDLER_GENERAL, ReadCallBack, (void *)AxiVdmaPtr, XAXIVDMA_READ);
    XAxiVdma_SetCallBack(AxiVdmaPtr, XAXIVDMA_HANDLER_ERROR, ReadErrorCallBack, (void *)AxiVdmaPtr, XAXIVDMA_READ);

    return XST_SUCCESS;
}

int drawImage(u32 displayHSize, u32 displayVSize, char *imagePointer) {
    for (int i = 0; i < displayVSize; i++) {
        for (int j = 0; j < displayHSize; j++) {
            Buffer[(i * displayHSize * 3) + (j * 3)] = *imagePointer;
            Buffer[(i * displayHSize * 3) + (j * 3) + 1] = *imagePointer;
            Buffer[(i * displayHSize * 3) + (j * 3) + 2] = *imagePointer;
            imagePointer++;
        }
    }
    Xil_DCacheFlush();
    return 0;
}
