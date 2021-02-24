-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    02/06/2020 00:15:53
-- Project Name:   PuertoEntrada
-- Module Name:    PuertoEntrada.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity PuertoEntrada is
   port(Direccion: in STD_LOGIC_VECTOR(8 downto 0);
		Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		Datos: out STD_LOGIC_VECTOR(15 downto 0);
		IOM, WR: in STD_LOGIC;
		clk: in STD_LOGIC
		);
end PuertoEntrada;

architecture arq1 of PuertoEntrada is
begin

process(clk, IOM, WR, Entrada, Direccion)
begin
	if clk'event and IOM='1' then	
		if Direccion = "000000000" and WR='0' then
			Datos <= Entrada;
		else
			Datos <= "ZZZZZZZZZZZZZZZZ";
		end if;	
	end if;
end process;


end arq1;
