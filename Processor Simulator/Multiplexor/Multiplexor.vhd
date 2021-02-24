-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    20/04/2020 19:59:49
-- Project Name:   Muliplexor
-- Module Name:    Muliplexor.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Multiplexor is
   port(Entrada1,Entrada2,Entrada3,Entrada4: in STD_LOGIC_VECTOR(15 downto 0);
		Salida: out STD_LOGIC_VECTOR(15 downto 0);
		Selector: in STD_LOGIC_VECTOR(1 downto 0)
		);
end Multiplexor;

architecture arq1 of Multiplexor is
begin

with Selector select
	Salida <= Entrada1 when "00",
			  Entrada2 when "01",
			  Entrada3 when "10",
			  Entrada4 when others;

end arq1;
