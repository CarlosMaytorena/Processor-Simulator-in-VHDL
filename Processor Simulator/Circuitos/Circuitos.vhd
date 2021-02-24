-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    17/04/2020 12:01:59
-- Project Name:   Circuitos
-- Module Name:    Circuitos.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

package Circuitos is

   component Registro9
      port(Entrada: in STD_LOGIC_VECTOR(8 downto 0);
		   Salida: out STD_LOGIC_VECTOR(8 downto 0);
		   L: in STD_LOGIC;
		   clk: in std_logic
		   );
   end component;

   component Registro12
      port(Entrada: in STD_LOGIC_VECTOR(11 downto 0);
		   Salida: out STD_LOGIC_VECTOR(11 downto 0);
		   L: in STD_LOGIC;
		   clk: in std_logic
		   );
   end component;

   component Contador9
      port(Entrada: in STD_LOGIC_VECTOR(8 downto 0);
		   Salida: out STD_LOGIC_VECTOR(8 downto 0);
		   Inc, L, clk: in STD_LOGIC	   
		   );
   end component;

   component ROM_Programa
      port(A : in STD_LOGIC_VECTOR(8 downto 0);
		   D : out STD_LOGIC_VECTOR(11 downto 0)
		   );
   end component;

   component MemoriadeControl
      port(COOP: in STD_LOGIC_VECTOR(11 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   clk: in STD_LOGIC
		   );
   end component;

   component CircuitoALU
      port(COOP: in STD_LOGIC_VECTOR(11 downto 0);
		   SRAM,SPBR,SP: in STD_LOGIC_VECTOR(15 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   MMBR: in STD_LOGIC_VECTOR(1 downto 0);
		   LMBR,LR1,LR2,LR3,LRF,MBRM: in STD_LOGIC;
		   SRF: out STD_LOGIC_VECTOR(2 downto 0);
		   clk: in STD_LOGIC
		   );
   end component;


   component RAM
      port(D: in STD_LOGIC_VECTOR(8 downto 0);
--		   P: inout STD_LOGIC_VECTOR( 15 downto 0);
		   Pin: in STD_LOGIC_VECTOR(15 downto 0);
		   Pout: out STD_LOGIC_VECTOR(15 downto 0);
		   RW,IOM: in STD_LOGIC
		   );
   end component;

   component PuertoEntrada
      port(Direccion: in STD_LOGIC_VECTOR(8 downto 0);
		   Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		   Datos: out STD_LOGIC_VECTOR(15 downto 0);
		   IOM, WR: in STD_LOGIC;
		   clk: in STD_LOGIC
		   );
   end component;

   component PuertoSalida
      port(Direccion: in STD_LOGIC_VECTOR(8 downto 0);
		   Datos: in STD_LOGIC_VECTOR(15 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   IOM,WR: in STD_LOGIC;
		   clk: in STD_LOGIC
		   );
   end component;

end package;
