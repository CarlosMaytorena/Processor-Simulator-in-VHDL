-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    20/04/2020 22:12:22
-- Project Name:   ALU
-- Module Name:    ALU.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity ALU is
   port(OP: in STD_LOGIC_VECTOR(3 downto 0);
		A,B: in STD_LOGIC_VECTOR(15 downto 0);
		R: out STD_LOGIC_VECTOR(15 downto 0);
		F: out STD_LOGIC_VECTOR(2 downto 0)
		);
end ALU;

architecture arq1 of ALU is

signal Z: STD_LOGIC_VECTOR(17 downto 0);
signal flag: STD_LOGIC_VECTOR(2 downto 0);

begin

with OP select
	Z<= STD_LOGIC_VECTOR(unsigned('0' & '0' & A)+unsigned('0'& '0' & B)) when "0001",
		STD_LOGIC_VECTOR(unsigned('0' & '0' & A)-unsigned('0' & '0' & B)) when "0010",
		STD_LOGIC_VECTOR(unsigned('0' & A(7 downto 0))*unsigned('0' & B(7 downto 0))) when "0011",
		STD_LOGIC_VECTOR(unsigned('0' & '0' & A)/unsigned('0' & '0' & B)) when "0100",
		('0' & '0' &  A) AND ('0' & '0' & B) when "0101",
		('0' & '0' & A) OR ('0' & '0' & B) when "0110",
		NOT ('0' & '0' & A) when "0111",
		('0' & '0' & A) XOR ('0' & '0' & B) when "1000",
		STD_LOGIC_VECTOR(unsigned('0' & '0' & A)-unsigned('0' & '0' & B)) when "1010",
		'0' & '0' & B when "1011",
		'0' & '0' & A when "1100",		
		Z when others;

with Z(17) select
	flag(2)<= '1' when '1',
		   '0' when others; 

with Z(17 downto 0) select
	flag(1)<= '1' when '0' & '0' & x"0000",
		   '0' when others; 

with flag(2 downto 1) select
	flag(0)<= '1' when "00",
		   '0' when others;

R<=Z(15 downto 0);
F<=flag;

end arq1;
