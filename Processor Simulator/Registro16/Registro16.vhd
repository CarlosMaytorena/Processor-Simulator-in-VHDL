-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    20/04/2020 21:01:22
-- Project Name:   Registro16
-- Module Name:    Registro16.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registro16 is
   port(Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		Salida: out STD_LOGIC_VECTOR(15 downto 0):=x"0000";
		L: in STD_LOGIC;
		clk: in std_logic
		);
end Registro16;

architecture arq1 of Registro16 is

begin

process (clk)
begin
	if clk'event and clk='1' and L='1' then
		Salida <= Entrada;
	end if;
end process;

end arq1;

