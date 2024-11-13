
// spi - Serial Peripheral Interface (master directions)
// 
module my_module (
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SPISEL" *)
  input <m_spisel>, // SPISEL input to the core (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SS_I" *)
  input <m_ss_i>, // Slave Select Input (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SS_O" *)
  output <m_ss_o>, // Slave Select Output (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SS_T" *)
  output <m_ss_t>, // Slave Select Tri-State Control (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SCK_I" *)
  input <m_sck_i>, // SPI Clock Input (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SCK_O" *)
  output <m_sck_o>, // SPI Clock Output (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SCK_T" *)
  output <m_sck_t>, // SPI Clock Tri-State Control (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO0_I" *)
  input <m_io0_i>, // IO0 Input Port (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO0_O" *)
  output <m_io0_o>, // IO0 Output Port (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO0_T" *)
  output <m_io0_t>, // IO0 Tri-State Control (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO1_I" *)
  input <m_io1_i>, // IO1 Input Port (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO1_O" *)
  output <m_io1_o>, // IO1 Output Port (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO1_T" *)
  output <m_io1_t>, // IO1 Tri-State Control (required)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO2_I" *)
  input <m_io2_i>, // IO2 Input Port (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO2_O" *)
  output <m_io2_o>, // IO2 Output Port (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO2_T" *)
  output <m_io2_t>, // IO2 Tri-State Control (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO3_I" *)
  input <m_io3_i>, // IO3 Input Port (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO3_O" *)
  output <m_io3_o>, // IO3 Output Port (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> IO3_T" *)
  output <m_io3_t>, // IO3 Tri-State Control (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SS1_O" *)
  output <m_ss1_o>, // Slave Select 1 Output (optional)
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 <interface_name> SS2_O" *)
  output <m_ss2_o>, // Slave Select 2 Output (optional)
//  additional ports here
);

//  user logic here

endmodule
			
			