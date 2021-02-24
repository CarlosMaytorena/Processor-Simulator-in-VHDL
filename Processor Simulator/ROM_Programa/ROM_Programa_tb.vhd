-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    17/04/2020 11:05:31
-- Project Name:   ROM_Programa
-- Module Name:    ROM_Programa_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity ROM_Programa_tb is
end    ROM_Programa_tb;

architecture Testbench of ROM_Programa_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component ROM_Programa
      port(A : in STD_LOGIC_VECTOR(8 downto 0);
		   D : out STD_LOGIC_VECTOR(11 downto 0)
		   );
   end component;

signal A : STD_LOGIC_VECTOR(8 downto 0);
signal D : STD_LOGIC_VECTOR(11 downto 0);

begin

   uut: ROM_Programa port map (A,D);

stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
	A<="000000001";
   
   wait for 100 ns;
	A<="000000010";

   wait for 100 ns;
   wait;

end process;

end Testbench;
