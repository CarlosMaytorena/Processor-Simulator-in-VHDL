-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    02/06/2020 17:05:23
-- Project Name:   PuertoSalida
-- Module Name:    PuertoSalida.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity PuertoSalida is
   port(Direccion: in STD_LOGIC_VECTOR(8 downto 0);
		Datos: in STD_LOGIC_VECTOR(15 downto 0);
		Salida: out STD_LOGIC_VECTOR(15 downto 0):=x"0000";
		IOM,WR: in STD_LOGIC;
		clk: in STD_LOGIC
		);
end PuertoSalida;

architecture arq1 of PuertoSalida is
begin

process(clk, IOM, WR, Datos, Direccion)
begin
	if clk'event and IOM='1' and Direccion = "000010000" and WR='1' then
			Salida <= Datos;
	end if;
end process;

end arq1;
