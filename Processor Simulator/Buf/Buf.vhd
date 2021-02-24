-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 19:17:25
-- Project Name:   Buf
-- Module Name:    Buf.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Buf is
   port(Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		Salida: out STD_LOGIC_VECTOR(15 downto 0);
		Control: in STD_LOGIC
		);
end Buf;

architecture arq1 of Buf is
begin

with Control select
	Salida<= Entrada when '1',
			 "ZZZZZZZZZZZZZZZZ" when others;

end arq1;

