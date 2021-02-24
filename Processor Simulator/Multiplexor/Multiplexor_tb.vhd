-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    20/04/2020 19:59:49
-- Project Name:   Muliplexor
-- Module Name:    Muliplexor_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Multiplexor_tb is
end    Multiplexor_tb;

architecture Testbench of Multiplexor_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Multiplexor
      port(Entrada1,Entrada2,Entrada3,Entrada4: in STD_LOGIC_VECTOR(15 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   Selector: in STD_LOGIC_VECTOR(1 downto 0)
		   );
   end component;

signal Entrada1,Entrada2,Entrada3,Entrada4,Salida: STD_LOGIC_VECTOR(15 downto 0);
signal Selector: STD_LOGIC_VECTOR(1 downto 0);

begin

   uut: Multiplexor port map (Entrada1,Entrada2,Entrada3,Entrada4,Salida,Selector);


stim_proc: process
begin
   wait for 100 ns;

	Entrada1 <= x"1111";
	Entrada2 <= x"1010";
	Entrada3 <= x"1FA1";
	Entrada4 <= x"1001";
	Selector <= "01";

   wait for 100 ns;

	Entrada1 <= x"0001";
	Entrada2 <= x"1011";
	Entrada3 <= x"1AB1";
	Entrada4 <= x"0BB1";
	Selector <= "11";

   wait for 100 ns;



   wait;

end process;

end Testbench;
