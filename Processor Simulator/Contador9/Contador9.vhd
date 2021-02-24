-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    15/04/2020 11:44:51
-- Project Name:   Contador9
-- Module Name:    Contador9.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Contador9 is
   port(Entrada: in STD_LOGIC_VECTOR(8 downto 0);
		Salida: out STD_LOGIC_VECTOR(8 downto 0);
		Inc, L, clk: in STD_LOGIC	   
 		);
end Contador9;

architecture arq1 of Contador9 is
begin


process (clk)

variable cuenta: unsigned(8 downto 0):= '0' & x"00";

begin
	Salida <= STD_LOGIC_VECTOR(cuenta);
	if clk'event and clk='1' then
		if L = '1' then
			cuenta:=unsigned(Entrada);
		elsif Inc = '1' then
			cuenta:= cuenta + 1;
		end if;
	end if;
end process;

end arq1;
