/*
 * main.c
 *
 */


#include "oled.h"
#include "xparameters.h"


int main(){
	char *myString = "Hello world";
	oledControl myOled;
	initOled(&myOled,XPAR_OLEDCONTROL_IP_0_BASEADDR);
	clearOled(&myOled);
	printOled(&myOled,myString);
	return 0;
}

