
// Normally AXI is automatically inferred.  However, if the names of your ports do not match, you can force the
// the creation of an interface and map the physical ports to the logical ports by using the X_INTERFACE_INFO
// attribute before each physical port
// Typical parameters the user might specify: PROTOCOL {AXI4, AXI4LITE, AXI3}, SUPPORTS_NARROW_BURST {0, 1}, NUM_READ_OUTSTANDING, NUM_WRITE_OUTSTANDING, MAX_BURST_LENGTH
// The PROTOCOL can be typically be inferred from the set of signals.
// aximm - AMBA AXI Interface (slave directions)
// 
// Allowed parameters:
//  CLK_DOMAIN                - Clk Domain                (string default: <blank>) 
//  PHASE                     - Phase                     (float) 
//  MAX_BURST_LENGTH          - Max Burst Length          (long default: 256) [1, 256]
//  NUM_WRITE_OUTSTANDING     - Num Write Outstanding     (long default: 1) [0, 32]
//  NUM_READ_OUTSTANDING      - Num Read Outstanding      (long default: 1) [0, 32]
//  SUPPORTS_NARROW_BURST     - Supports Narrow Burst     (long default: 1) [0, 1]
//  READ_WRITE_MODE           - Read Write Mode           (string default: READ_WRITE) {READ_WRITE,READ_ONLY,WRITE_ONLY}
//  BUSER_WIDTH               - Buser Width               (long) 
//  RUSER_WIDTH               - Ruser Width               (long) 
//  WUSER_WIDTH               - Wuser Width               (long) 
//  ARUSER_WIDTH              - Aruser Width              (long) 
//  AWUSER_WIDTH              - Awuser Width              (long) 
//  ADDR_WIDTH                - Addr Width                (long default: 32) [1, 64]
//  ID_WIDTH                  - Id Width                  (long) 
//  FREQ_HZ                   - Frequency                 (float default: 100000000) 
//  PROTOCOL                  - Protocol                  (string default: AXI4) {AXI4,AXI4LITE,AXI3}
//  DATA_WIDTH                - Data Width                (long default: 32) {32,64,128,256,512,1024}
//  HAS_BURST                 - Has BURST                 (long default: 1) {0,1}
//  HAS_CACHE                 - Has CACHE                 (long default: 1) {0,1}
//  HAS_LOCK                  - Has LOCK                  (long default: 1) {0,1}
//  HAS_PROT                  - Has PROT                  (long default: 1) {0,1}
//  HAS_QOS                   - Has QOS                   (long default: 1) {0,1}
//  HAS_REGION                - Has REGION                (long default: 1) {0,1}
//  HAS_WSTRB                 - Has WSTRB                 (long default: 1) {0,1}
//  HAS_BRESP                 - Has BRESP                 (long default: 1) {0,1}
//  HAS_RRESP                 - Has RRESP                 (long default: 1) {0,1}
module my_module (
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWID" *)
  // Uncomment the following to set interface specific parameter on the bus interface.
  //  (* X_INTERFACE_PARAMETER = "CLK_DOMAIN <value>,PHASE <value>,MAX_BURST_LENGTH <value>,NUM_WRITE_OUTSTANDING <value>,NUM_READ_OUTSTANDING <value>,SUPPORTS_NARROW_BURST <value>,READ_WRITE_MODE <value>,BUSER_WIDTH <value>,RUSER_WIDTH <value>,WUSER_WIDTH <value>,ARUSER_WIDTH <value>,AWUSER_WIDTH <value>,ADDR_WIDTH <value>,ID_WIDTH <value>,FREQ_HZ <value>,PROTOCOL <value>,DATA_WIDTH <value>,HAS_BURST <value>,HAS_CACHE <value>,HAS_LOCK <value>,HAS_PROT <value>,HAS_QOS <value>,HAS_REGION <value>,HAS_WSTRB <value>,HAS_BRESP <value>,HAS_RRESP <value>" *)
  input [<left_bound>:0] <s_awid>, // Write address ID (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWADDR" *)
  input [<left_bound>:0] <s_awaddr>, // Write address (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWLEN" *)
  input [<left_bound>:0] <s_awlen>, // Burst length (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWSIZE" *)
  input [2:0] <s_awsize>, // Burst size (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWBURST" *)
  input [1:0] <s_awburst>, // Burst type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWLOCK" *)
  input [<left_bound>:0] <s_awlock>, // Lock type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWCACHE" *)
  input [3:0] <s_awcache>, // Cache type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWPROT" *)
  input [2:0] <s_awprot>, // Protection type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWREGION" *)
  input [3:0] <s_awregion>, // Write address slave region (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWQOS" *)
  input [3:0] <s_awqos>, // Transaction Quality of Service token (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWUSER" *)
  input [<left_bound>:0] <s_awuser>, // Write address user sideband (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWVALID" *)
  input <s_awvalid>, // Write address valid (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> AWREADY" *)
  output <s_awready>, // Write address ready (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WID" *)
  input [<left_bound>:0] <s_wid>, // Write ID tag (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WDATA" *)
  input [<left_bound>:0] <s_wdata>, // Write data (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WSTRB" *)
  input [<left_bound>:0] <s_wstrb>, // Write strobes (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WLAST" *)
  input <s_wlast>, // Write last beat (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WUSER" *)
  input [<left_bound>:0] <s_wuser>, // Write data user sideband (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WVALID" *)
  input <s_wvalid>, // Write valid (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> WREADY" *)
  output <s_wready>, // Write ready (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BID" *)
  output [<left_bound>:0] <s_bid>, // Response ID (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BRESP" *)
  output [1:0] <s_bresp>, // Write response (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BUSER" *)
  output [<left_bound>:0] <s_buser>, // Write response user sideband (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BVALID" *)
  output <s_bvalid>, // Write response valid (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> BREADY" *)
  input <s_bready>, // Write response ready (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARID" *)
  input [<left_bound>:0] <s_arid>, // Read address ID (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARADDR" *)
  input [<left_bound>:0] <s_araddr>, // Read address (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARLEN" *)
  input [<left_bound>:0] <s_arlen>, // Burst length (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARSIZE" *)
  input [2:0] <s_arsize>, // Burst size (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARBURST" *)
  input [1:0] <s_arburst>, // Burst type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARLOCK" *)
  input [<left_bound>:0] <s_arlock>, // Lock type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARCACHE" *)
  input [3:0] <s_arcache>, // Cache type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARPROT" *)
  input [2:0] <s_arprot>, // Protection type (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARREGION" *)
  input [3:0] <s_arregion>, // Read address slave region (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARQOS" *)
  input [3:0] <s_arqos>, // Quality of service token (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARUSER" *)
  input [<left_bound>:0] <s_aruser>, // Read address user sideband (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARVALID" *)
  input <s_arvalid>, // Read address valid (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> ARREADY" *)
  output <s_arready>, // Read address ready (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RID" *)
  output [<left_bound>:0] <s_rid>, // Read ID tag (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RDATA" *)
  output [<left_bound>:0] <s_rdata>, // Read data (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RRESP" *)
  output [1:0] <s_rresp>, // Read response (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RLAST" *)
  output <s_rlast>, // Read last beat (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RUSER" *)
  output [<left_bound>:0] <s_ruser>, // Read user sideband (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RVALID" *)
  output <s_rvalid>, // Read valid (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 <interface_name> RREADY" *)
  input <s_rready>, // Read ready (optional)
//  additional ports here
);

//  user logic here

endmodule
			
			