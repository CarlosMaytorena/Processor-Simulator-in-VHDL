-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 01:21:44
-- Project Name:   Registro2
-- Module Name:    Registro2.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registro2 is
   port(Entrada: in STD_LOGIC_VECTOR(2 downto 0);
		Salida: out STD_LOGIC_VECTOR(2 downto 0):="000";
		L: in STD_LOGIC;
		clk: in std_logic
		);
end Registro2;

architecture arq1 of Registro2 is

begin

process (clk)
begin
	if clk'event and clk='1' and L='1' then
		Salida <= Entrada;
	end if;
end process;

end arq1;
