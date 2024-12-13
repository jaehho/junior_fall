-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1.2 (win64) Build 5164865 Thu Sep  5 14:37:11 MDT 2024
-- Date        : Fri Dec 13 14:25:33 2024
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/jaeho/junior_fall/hardware/proj3/playground/playground.gen/sources_1/bd/design_1/ip/design_1_mux_0_0/design_1_mux_0_0_stub.vhdl
-- Design      : design_1_mux_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_mux_0_0 is
  Port ( 
    i_data : in STD_LOGIC_VECTOR ( 23 downto 0 );
    i_control : in STD_LOGIC;
    o_data : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );

end design_1_mux_0_0;

architecture stub of design_1_mux_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_data[23:0],i_control,o_data[23:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mux,Vivado 2024.1.2";
begin
end;
