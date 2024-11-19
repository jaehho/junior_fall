--Example design Top
-- file: exdes_top.vhd
-- 
-- (c) Copyright 2008 - 2023 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Advanced Micro Devices, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
------------------------------------------------------------------------------
-- User entered comments
------------------------------------------------------------------------------
-- This is a self-desigined TOP Wrapper developed for QSPI Example Design
--
------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Library xpm;
use xpm.vcomponents.all;

Library UNISIM;
use UNISIM.vcomponents.all;

library work;
entity axi_quad_spi_0_exdes is
 PORT (
    clk_p       : in std_logic;
    clk_n       : in std_logic;
    reset       : in std_logic;
	atg_done    : OUT STD_LOGIC;
      axi_clk_out    : out std_logic;
      axi_aresetn_out    : out std_logic;
    IO0_IO     : inout STD_LOGIC;
    IO1_IO     : inout STD_LOGIC;
	
--
--
--
--    SS_IO     : inout STD_LOGIC;
--	
--	
--

    SS_IO     : inout STD_LOGIC_VECTOR(0 DOWNTO 0);
	
	
	
	atg_status  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
end entity;

architecture impl of axi_quad_spi_0_exdes is

--------------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of impl : architecture is "yes";
--------------------------------------------------------------------------------------
COMPONENT clk_wiz_0
port
 (-- Clock in ports
  clk_in1_p         : in     std_logic;
  clk_in1_n         : in     std_logic;
  -- Clock out ports
  clk_out1          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic
 );
end COMPONENT;

COMPONENT axi_traffic_gen_1
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    m_axi_lite_ch1_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_lite_ch1_awvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_awready : IN STD_LOGIC;
    m_axi_lite_ch1_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_lite_ch1_wvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_wready : IN STD_LOGIC;
    m_axi_lite_ch1_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_lite_ch1_bvalid : IN STD_LOGIC;
    m_axi_lite_ch1_bready : OUT STD_LOGIC;
    m_axi_lite_ch1_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_arvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_arready : IN STD_LOGIC;
    m_axi_lite_ch1_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_rvalid : IN STD_LOGIC;
    m_axi_lite_ch1_rready : OUT STD_LOGIC;
    m_axi_lite_ch1_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    done : OUT STD_LOGIC;
    status : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
COMPONENT axi_traffic_gen_2
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    m_axi_lite_ch1_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_lite_ch1_awvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_awready : IN STD_LOGIC;
    m_axi_lite_ch1_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_lite_ch1_wvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_wready : IN STD_LOGIC;
    m_axi_lite_ch1_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_lite_ch1_bvalid : IN STD_LOGIC;
    m_axi_lite_ch1_bready : OUT STD_LOGIC;
    m_axi_lite_ch1_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_arvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_arready : IN STD_LOGIC;
    m_axi_lite_ch1_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_rvalid : IN STD_LOGIC;
    m_axi_lite_ch1_rready : OUT STD_LOGIC;
    m_axi_lite_ch1_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    done : OUT STD_LOGIC;
    status : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT axi_traffic_gen_3
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    m_axi_lite_ch1_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_lite_ch1_awvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_awready : IN STD_LOGIC;
    m_axi_lite_ch1_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_lite_ch1_wvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_wready : IN STD_LOGIC;
    m_axi_lite_ch1_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_lite_ch1_bvalid : IN STD_LOGIC;
    m_axi_lite_ch1_bready : OUT STD_LOGIC;
    m_axi_lite_ch1_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_arvalid : OUT STD_LOGIC;
    m_axi_lite_ch1_arready : IN STD_LOGIC;
    m_axi_lite_ch1_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_lite_ch1_rvalid : IN STD_LOGIC;
    m_axi_lite_ch1_rready : OUT STD_LOGIC;
    m_axi_lite_ch1_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    done : OUT STD_LOGIC;
    status : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT axi_quad_spi_0
  PORT (
    ext_spi_clk : IN STD_LOGIC;
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC;
	
    io0_i : IN STD_LOGIC;
    io0_o : OUT STD_LOGIC;
    io0_t : OUT STD_LOGIC;
    io1_i : IN STD_LOGIC;
    io1_o : OUT STD_LOGIC;
    io1_t : OUT STD_LOGIC;
	
	
	
	
    ss_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	
    ss_t : OUT STD_LOGIC;
	
    ip2intc_irpt : OUT STD_LOGIC
  );
END COMPONENT;

--------------AXI_QUAD_SPI_Component------------------------------

------------- Signal Declaration-----------------------
   signal m_axi_lite_ch1_awaddr : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_awvalid : STD_LOGIC:= '0';
   signal m_axi_lite_ch1_wdata : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wstrb :  STD_LOGIC_VECTOR(3 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wvalid :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_bready :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_araddr :  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_arvalid :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_rready :  STD_LOGIC:= '0';
   
  signal   s_axi_awready : STD_LOGIC:= '0';
  signal   s_axi_wready : STD_LOGIC:= '0';
  signal   s_axi_bresp : STD_LOGIC_VECTOR(1 DOWNTO 0):=(others => '0');
  signal   s_axi_bvalid : STD_LOGIC:= '0';
  signal   s_axi_arready : STD_LOGIC:= '0';
  signal   s_axi_rdata : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
  signal   s_axi_rresp : STD_LOGIC_VECTOR(1 DOWNTO 0):=(others => '0');
  signal   s_axi_rvalid : STD_LOGIC:= '0';
  
  signal   atg_done_1    : STD_LOGIC:= '0';
  signal   atg_status_1  : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
  signal m_axi_lite_ch1_awaddr_1 : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_awvalid_1 : STD_LOGIC:= '0';
   signal m_axi_lite_ch1_wdata_1 : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wstrb_1 :  STD_LOGIC_VECTOR(3 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wvalid_1 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_bready_1 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_araddr_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_arvalid_1 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_rready_1 :  STD_LOGIC:= '0';
   
  signal   atg_done_2    : STD_LOGIC:= '0';
  signal   atg_status_2  : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
  signal m_axi_lite_ch1_awaddr_2 : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_awvalid_2 : STD_LOGIC:= '0';
   signal m_axi_lite_ch1_wdata_2 : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wstrb_2 :  STD_LOGIC_VECTOR(3 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wvalid_2 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_bready_2 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_araddr_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_arvalid_2 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_rready_2 :  STD_LOGIC:= '0';
   
 
    signal   atg_done_3    : STD_LOGIC:= '0';
  signal   atg_status_3  : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
  signal m_axi_lite_ch1_awaddr_3 : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_awvalid_3 : STD_LOGIC:= '0';
   signal m_axi_lite_ch1_wdata_3 : STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wstrb_3 :  STD_LOGIC_VECTOR(3 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_wvalid_3 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_bready_3 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_araddr_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others => '0');
   signal m_axi_lite_ch1_arvalid_3 :  STD_LOGIC:= '0';
   signal m_axi_lite_ch1_rready_3 :  STD_LOGIC:= '0';
   
 	
   
  signal   io0_i : STD_LOGIC:= '0';
  signal   io0_o : STD_LOGIC:= '0';
  signal   io0_t : STD_LOGIC:= '0';
  signal   io1_i :STD_LOGIC:= '0';
  signal   io1_o : STD_LOGIC:= '0';
  signal   io1_t : STD_LOGIC:= '0';
	
  signal   sck_i : STD_LOGIC:= '0';
  signal   sck_o : STD_LOGIC:= '0';
  signal   sck_t : STD_LOGIC:= '0';
  signal   ss_i : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   ss_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
 
	
  signal   ss_t : STD_LOGIC:= '0';
  signal   ip2intc_irpt : STD_LOGIC:= '0';
	
  ------ CLK WIZ signals------------
  signal  axi_clk      :  std_logic:= '0';
  signal  locked       :  std_logic:= '0';
  signal  axi_aresetn  :  std_logic:= '0';
  -------------Memory model Signals---------------
  signal   sio0_i : STD_LOGIC:= '0';
  signal   sio0_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   sio1_i :STD_LOGIC:= '0';
  signal   sio1_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   sio2_i : STD_LOGIC:= '0';
  signal   sio2_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   sio3_i :STD_LOGIC:= '0';
  signal   sio3_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');

-------------------------------------------------------
signal BRAM_Clk_A    : std_logic;
signal BRAM_Rst_A    : std_logic;
signal BRAM_En_A     : std_logic;
signal BRAM_WE_A     : std_logic_vector(3 DOWNTO 0) := (others => '0');
signal BRAM_Addr_A   : std_logic_vector(11 DOWNTO 0) := (others => '0');
signal BRAM_WrData_A : std_logic_vector(31 DOWNTO 0) := (others => '0');
signal BRAM_RdData_A : std_logic_vector(31 DOWNTO 0) := (others => '0');
signal clock_sg : std_logic; -- to be used for SG in async mode


begin

CLK_GEN : clk_wiz_0
   port map ( 
   -- Clock in ports
   clk_in1_p => clk_p,
   clk_in1_n => clk_n,
  -- Clock out ports  
   clk_out1 => axi_clk,
  -- Status and control signals                
   reset => reset,
   locked => locked            
 );
axi_aresetn <= locked;
axi_aresetn_out <= locked;
axi_clk_out <= axi_clk;


Instance_ATG_1 : axi_traffic_gen_1
  PORT MAP (
    s_axi_aclk => axi_clk,
    s_axi_aresetn => axi_aresetn,
    m_axi_lite_ch1_awaddr => m_axi_lite_ch1_awaddr_1,
    m_axi_lite_ch1_awprot => open,
    m_axi_lite_ch1_awvalid => m_axi_lite_ch1_awvalid_1,
    m_axi_lite_ch1_awready => s_axi_awready,
    m_axi_lite_ch1_wdata => m_axi_lite_ch1_wdata_1,
    m_axi_lite_ch1_wstrb => m_axi_lite_ch1_wstrb_1,
    m_axi_lite_ch1_wvalid => m_axi_lite_ch1_wvalid_1,
    m_axi_lite_ch1_wready => s_axi_wready,
    m_axi_lite_ch1_bresp => s_axi_bresp,
    m_axi_lite_ch1_bvalid => s_axi_bvalid,
    m_axi_lite_ch1_bready => m_axi_lite_ch1_bready_1,
    m_axi_lite_ch1_araddr => m_axi_lite_ch1_araddr_1,
    m_axi_lite_ch1_arvalid => m_axi_lite_ch1_arvalid_1,
    m_axi_lite_ch1_arready => s_axi_arready,
    m_axi_lite_ch1_rdata => s_axi_rdata,
    m_axi_lite_ch1_rvalid => s_axi_rvalid,
    m_axi_lite_ch1_rready => m_axi_lite_ch1_rready_1,
    m_axi_lite_ch1_rresp => s_axi_rresp,
    done => atg_done_1,
    status => atg_status_1
  );

 Instance_ATG_2 : axi_traffic_gen_2
  PORT MAP (
    s_axi_aclk => axi_clk,
    s_axi_aresetn => atg_done_1,
    m_axi_lite_ch1_awaddr => m_axi_lite_ch1_awaddr_2,
    m_axi_lite_ch1_awprot => open,
    m_axi_lite_ch1_awvalid => m_axi_lite_ch1_awvalid_2,
    m_axi_lite_ch1_awready => s_axi_awready,
    m_axi_lite_ch1_wdata => m_axi_lite_ch1_wdata_2,
    m_axi_lite_ch1_wstrb => m_axi_lite_ch1_wstrb_2,
    m_axi_lite_ch1_wvalid => m_axi_lite_ch1_wvalid_2,
    m_axi_lite_ch1_wready => s_axi_wready,
    m_axi_lite_ch1_bresp => s_axi_bresp,
    m_axi_lite_ch1_bvalid => s_axi_bvalid,
    m_axi_lite_ch1_bready => m_axi_lite_ch1_bready_2,
    m_axi_lite_ch1_araddr => m_axi_lite_ch1_araddr_2,
    m_axi_lite_ch1_arvalid => m_axi_lite_ch1_arvalid_2,
    m_axi_lite_ch1_arready => s_axi_arready,
    m_axi_lite_ch1_rdata => s_axi_rdata,
    m_axi_lite_ch1_rvalid => s_axi_rvalid,
    m_axi_lite_ch1_rready => m_axi_lite_ch1_rready_2,
    m_axi_lite_ch1_rresp => s_axi_rresp,
    done => atg_done_2,
    status => atg_status_2
  );

Instance_ATG_3 : axi_traffic_gen_3
  PORT MAP (
    s_axi_aclk => axi_clk,
    s_axi_aresetn => atg_done_2,
    m_axi_lite_ch1_awaddr => m_axi_lite_ch1_awaddr_3,
    m_axi_lite_ch1_awprot => open,
    m_axi_lite_ch1_awvalid => m_axi_lite_ch1_awvalid_3,
    m_axi_lite_ch1_awready => s_axi_awready,
    m_axi_lite_ch1_wdata => m_axi_lite_ch1_wdata_3,
    m_axi_lite_ch1_wstrb => m_axi_lite_ch1_wstrb_3,
    m_axi_lite_ch1_wvalid => m_axi_lite_ch1_wvalid_3,
    m_axi_lite_ch1_wready => s_axi_wready,
    m_axi_lite_ch1_bresp => s_axi_bresp,
    m_axi_lite_ch1_bvalid => s_axi_bvalid,
    m_axi_lite_ch1_bready => m_axi_lite_ch1_bready_3,
    m_axi_lite_ch1_araddr => m_axi_lite_ch1_araddr_3,
    m_axi_lite_ch1_arvalid => m_axi_lite_ch1_arvalid_3,
    m_axi_lite_ch1_arready => s_axi_arready,
    m_axi_lite_ch1_rdata => s_axi_rdata,
    m_axi_lite_ch1_rvalid => s_axi_rvalid,
    m_axi_lite_ch1_rready => m_axi_lite_ch1_rready_3,
    m_axi_lite_ch1_rresp => s_axi_rresp,
    done => atg_done,
    status => atg_status_3
  );
  
  
   m_axi_lite_ch1_awaddr <= m_axi_lite_ch1_awaddr_1 WHEN (atg_done_1 = '0') ELSE 
                            m_axi_lite_ch1_awaddr_2 WHEN (atg_done_2 = '0') ELSE
							m_axi_lite_ch1_awaddr_3;
							
   m_axi_lite_ch1_awvalid <= m_axi_lite_ch1_awvalid_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_awvalid_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_awvalid_3;

   m_axi_lite_ch1_wdata <= m_axi_lite_ch1_wdata_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_wdata_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_wdata_3;
							 
   m_axi_lite_ch1_wstrb <= m_axi_lite_ch1_wstrb_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_wstrb_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_wstrb_3;

   m_axi_lite_ch1_wvalid <= m_axi_lite_ch1_wvalid_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_wvalid_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_wvalid_3;
							 
   m_axi_lite_ch1_bready <= m_axi_lite_ch1_bready_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_bready_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_bready_3;

   m_axi_lite_ch1_araddr <= m_axi_lite_ch1_araddr_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_araddr_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_araddr_3;

   m_axi_lite_ch1_arvalid <= m_axi_lite_ch1_arvalid_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_arvalid_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_arvalid_3;
							 
   m_axi_lite_ch1_rready <= m_axi_lite_ch1_rready_1 WHEN (atg_done_1 = '0') ELSE 
                             m_axi_lite_ch1_rready_2 WHEN (atg_done_2 = '0') ELSE
							 m_axi_lite_ch1_rready_3;
							 
    atg_status <= atg_status_3 or atg_status_2 or atg_status_1;
	
  DUT : axi_quad_spi_0
  PORT MAP (
    ext_spi_clk => axi_clk,
    s_axi_aclk =>  axi_clk,
    s_axi_aresetn => axi_aresetn,
    s_axi_awaddr => m_axi_lite_ch1_awaddr(6 downto 0),
    s_axi_awvalid => m_axi_lite_ch1_awvalid,
    s_axi_awready => s_axi_awready,
    s_axi_wdata => m_axi_lite_ch1_wdata,
    s_axi_wstrb => m_axi_lite_ch1_wstrb,
    s_axi_wvalid => m_axi_lite_ch1_wvalid,
    s_axi_wready => s_axi_wready,
    s_axi_bresp => s_axi_bresp,
    s_axi_bvalid => s_axi_bvalid,
    s_axi_bready => m_axi_lite_ch1_bready,
    s_axi_araddr => m_axi_lite_ch1_araddr(6 downto 0),
    s_axi_arvalid => m_axi_lite_ch1_arvalid,
    s_axi_arready => s_axi_arready,
    s_axi_rdata => s_axi_rdata,
    s_axi_rresp => s_axi_rresp,
    s_axi_rvalid => s_axi_rvalid,
    s_axi_rready => m_axi_lite_ch1_rready,
	
	
	
    io0_i => io0_i,
    io0_o => io0_o,
    io0_t => io0_t,
    io1_i => io1_i,
    io1_o => io1_o,
    io1_t => io1_t,
	
	
	
	
    ss_i => ss_i,
    ss_o => ss_o,
    ss_t => ss_t,
	
    ip2intc_irpt => ip2intc_irpt
  );

---------------Updated-----------------

-------- 7 series family--------
QSPI_IO0_0: IOBUF
   port map (
      O  => io0_i,
      IO => IO0_IO,
      I  => io0_o,
      T  => io0_t
   );
QSPI_IO1_0: IOBUF
   port map (
      O  => io1_i,
      IO => IO1_IO,
      I  => io1_o,
      T  => io1_t
   );
GEN_REG: 
   for I in 0 to 0 generate
      QSPI_SS_mem : IOBUF port map (
      O  => ss_i(I),
      IO => SS_IO(I),
      I  => ss_o(I),
      T  => ss_t
		);
end generate GEN_REG;
-------- 7 series family--------


end impl;
