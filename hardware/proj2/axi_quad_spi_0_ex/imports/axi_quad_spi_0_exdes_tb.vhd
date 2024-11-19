	
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
-- This is a self-desigined Test bench developed for QSPI Example Design
--
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use std.env.all;


library unisim;
use unisim.vcomponents.all;
library work;

entity axi_quad_spi_0_exdes_tb is
end entity;

architecture tb of axi_quad_spi_0_exdes_tb is
  COMPONENT axi_quad_spi_0_exdes is
 PORT (
    clk_p       : in std_logic;
    clk_n       : in std_logic;
    reset       : in std_logic;
	atg_done    : OUT STD_LOGIC;
      axi_clk_out    : out std_logic;
      axi_aresetn_out    : out std_logic;
    IO0_IO     : inout STD_LOGIC;
    IO1_IO     : inout STD_LOGIC;
	
    SS_IO     : inout STD_LOGIC_VECTOR(0 DOWNTO 0);
	
	
	
	atg_status  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );

  end COMPONENT;

-----------------------Model Component-----------------
COMPONENT memory_model 
 generic
  (
    C_FIFO_DEPTH          : integer              := 256;-- allowed 0,16,256.
	C_SPI_MODE            : integer range 0 to 2 := 0; -- used for differentiating
                                                             -- Standard, Dual or Quad mode
                                                             -- in Ports as well as internal
                                                             -- functionality
	C_DATA_WIDTH          : integer               := 8       -- allowed 8,32.
    );
 port
  (
    MODEL_CLK            : in  std_logic;
    MODEL_RESET          : in  std_logic;
    Core_Clk             : in std_logic;
    Chip_Selectn         : in std_logic;
	
    -------------------------------
       --*SPI port interface      * --
       -------------------------------
       io0_i          : in std_logic;  -- MOSI signal in standard SPI
       io0_o          : out std_logic;
       io0_t          : out std_logic;
       -------------------------------
       io1_i          : in std_logic;  -- MISO signal in standard SPI
       io1_o          : out std_logic;
       io1_t          : out std_logic;
       -----------------
       -- quad mode pins
       -----------------
       io2_i          : in std_logic;
       io2_o          : out std_logic;
       io2_t          : out std_logic;
       ---------------
       io3_i          : in std_logic;
       io3_o          : out std_logic;
       io3_t          : out std_logic
       ---------------------------------

);
END COMPONENT;


  signal   IO0_IO_mem :  STD_LOGIC:= '0';
  signal   IO1_IO_mem : STD_LOGIC:= '0';
  signal   IO2_IO_mem : STD_LOGIC:= '0';
  signal   IO3_IO_mem : STD_LOGIC:= '0';
  signal   SCK_IO_mem : STD_LOGIC:= '0';
  signal   SS_IO_mem : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   SS_IO_one : STD_LOGIC;
--	
--	
--  signal   SS_IO_multiple : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
--
--
  signal   SS_IO_multiple : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');

  signal   sio0_i : STD_LOGIC:= '0';
  signal   sio0_t : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '1');
  signal   sio0_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   sio1_i :STD_LOGIC:= '0';
  signal   sio1_t :STD_LOGIC:= '0';
  signal   sio1_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   sio2_i : STD_LOGIC:= '0';
  signal   sio2_t : STD_LOGIC:= '0';
  signal   sio2_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   sio3_i :STD_LOGIC:= '0';
  signal   sio3_t :STD_LOGIC:= '0';
  signal   sio3_o : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   Mem_Clk : STD_LOGIC:= '0';
  
  signal   CS : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   axi_clk : STD_LOGIC:= '0';
  signal   axi_aresetn : STD_LOGIC:= '0';
  signal   sio0_o_red : STD_LOGIC:= '0';
  signal   sio1_o_red : STD_LOGIC:= '0';
  signal   sio2_o_red : STD_LOGIC:= '0';
  signal   sio3_o_red : STD_LOGIC:= '0';
  signal   sio_t_red : STD_LOGIC:= '1';
  signal   IO0_IO :  STD_LOGIC:= '0';
  signal   IO1_IO : STD_LOGIC:= '0';
  signal   IO2_IO : STD_LOGIC:= '0';
  signal   IO3_IO : STD_LOGIC:= '0';
  signal   SCK_IO : STD_LOGIC:= '0';
  signal   SS_IO : STD_LOGIC_VECTOR(0 DOWNTO 0):=(others => '0');
  signal   IO0_IO_Master :  STD_LOGIC:= '0';
  signal   IO1_IO_Master : STD_LOGIC:= '0';
  signal   IO2_IO_Master : STD_LOGIC:= '0';
  signal   IO3_IO_Master : STD_LOGIC:= '0';
  signal   SCK_IO_Master : STD_LOGIC:= '0';
  signal   SS_IO_Master : STD_LOGIC;

signal local_clk_p : std_logic := '0';
signal local_clk_n : std_logic := '1';
signal local_reset : std_logic := '1';
signal local_atg_done : std_logic;
signal local_atg_status : std_logic_vector(31 downto 0);
-----
begin
-----
process 
-----
begin
-----       
            report "EXAMPLE DESIGN NOT SUPPORTED WHEN STARTUP = 1,Test Completed Successfully" severity FAILURE;
			wait;
end process;
	

-----
----------------------------------------------
-- PROCESS_CLK_GEN_P: generate the clock with 100 Mhz
PROCESS_CLK_GEN_P: process
-----
begin
-----
    wait for 2.5 ns;
    local_clk_p <= not local_clk_p;
end process PROCESS_CLK_GEN_P;

------------------------------------------------------------------
----------------------------------------------
-- PROCESS_CLK_GEN_N: generate the clock with 100 Mhz
PROCESS_CLK_GEN_N: process
-----
begin
-----
    wait for 2.5 ns;
    local_clk_n <= not local_clk_n;
end process PROCESS_CLK_GEN_N;

------------------------------------------------
--assert not (C_USE_STARTUP = 1)
  --report "Example Design is not supported with the STARTUPE2 block is included in the design"
 -- severity ERROR;
------------------------------------------------------------------
----------------------------------------------
-- PROCESS_RST_GEN: generate the clock with 100 Mhz
PROCESS_RST_GEN: process
-----
begin
-----
    wait for 25 ns;
    local_reset <= '1';
    wait for 70 ns;
    local_reset <= '0';
    wait;
end process PROCESS_RST_GEN;

------------------------------------------------------------------
process (local_atg_done)
-----
begin
-----
        if (local_atg_done'event and local_atg_done = '1') then
          if (local_atg_status(1 downto 0) = "01") then
            report "Test Completed Successfully" severity NOTE; 
            std.env.stop(0);
          elsif (local_atg_status(1 downto 0) = "10") then
            report "Test Failure" severity FAILURE;
          elsif (local_atg_status(1 downto 0) = "11") then
            report "Test Hanged" severity FAILURE;
          end if;
        end if;
end process;


  INST_Memory_Model_0: memory_model 
 generic map
  (
    C_FIFO_DEPTH           => 16,-- allowed 0,16,256.
	C_SPI_MODE             => 0, -- used for differentiating
                                                             -- Standard, Dual or Quad mode
                                                             -- in Ports as well as internal
                                                             -- functionality
	C_DATA_WIDTH           => 32       -- allowed 8,32.
    )
 port map
  (
    MODEL_CLK             => axi_clk,
    MODEL_RESET           => axi_aresetn,
    Core_Clk              => Mem_Clk,
    Chip_Selectn     => SS_IO_multiple(0),
    -------------------------------
       --*SPI port interface      * --
       -------------------------------
       io0_i           => sio0_i,  -- MOSI signal in standard SPI
       io0_o           => sio0_o(0),
       io0_t           => sio0_t(0),
       -------------------------------
       io1_i           => sio1_i,  -- MISO signal in standard SPI
       io1_o           => sio1_o(0),
       io1_t           => sio1_t,
       -----------------
       -- quad mode pins
       -----------------
       io2_i           => sio2_i,
       io2_o           => sio2_o(0),
       io2_t           => sio2_t,
       ---------------
       io3_i           => sio3_i,
       io3_o           => sio3_o(0),
       io3_t           => sio3_t
       ---------------------------------

);
	
sio0_o_red  <= or_reduce(sio0_o);
sio1_o_red  <= or_reduce(sio1_o);
sio2_o_red  <= or_reduce(sio2_o);
sio3_o_red  <= or_reduce(sio3_o);
sio_t_red  <= and_reduce(sio0_t);

QSPI_IO0_mem: IOBUF
   port map (
      O  => sio0_i,
      IO => IO0_IO_mem,
      I  => sio0_o_red,
      T  => sio_t_red
   );
           
QSPI_IO1_mem: IOBUF
   port map (
      O  => sio1_i,
      IO => IO1_IO_mem,
      I  => sio1_o_red,
      T  => sio1_t
   );
EXDES: axi_quad_spi_0_exdes
  port map (
       clk_p       => local_clk_p,
       clk_n       => local_clk_n,
       reset       => local_reset,
       atg_done    => local_atg_done,
       axi_aresetn_out    => axi_aresetn,
       axi_clk_out    => axi_clk,
	
       IO0_IO     => IO0_IO_mem,
       IO1_IO     => IO1_IO_mem,
	
	
--
--
--	
--
--    SS_IO     => SS_IO_one,
--	
--	
--
    SS_IO     => SS_IO_multiple,

	
	
       atg_status  => local_atg_status
  );
  
------------------------------------------------------------------

end tb;
