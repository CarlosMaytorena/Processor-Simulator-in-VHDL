-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    15/04/2020 00:07:39
-- Project Name:   IR
-- Module Name:    IR.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registro12 is
   port(Entrada: in STD_LOGIC_VECTOR(11 downto 0);
		Salida: out STD_LOGIC_VECTOR(11 downto 0):=x"000";
		L: in STD_LOGIC;
		clk: in std_logic
		);
end Registro12;

architecture arq1 of Registro12 is

begin

process (clk)
begin
	if clk'event and clk='1' and L='1' then
		Salida <= Entrada;
	end if;
end process;

end arq1;
