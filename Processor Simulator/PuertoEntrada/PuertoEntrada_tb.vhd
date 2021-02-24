-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    02/06/2020 00:15:53
-- Project Name:   PuertoEntrada
-- Module Name:    PuertoEntrada_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity PuertoEntrada_tb is
end    PuertoEntrada_tb;

architecture Testbench of PuertoEntrada_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component PuertoEntrada
      port(Direccion: in STD_LOGIC_VECTOR(8 downto 0);
		   Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		   Datos: out STD_LOGIC_VECTOR(15 downto 0);
		   IOM, WR: in STD_LOGIC;
		   clk: in STD_LOGIC
		   );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: PuertoEntrada use entity WORK.PuertoEntrada(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal Direccion: STD_LOGIC_VECTOR(8 downto 0);
   signal Entrada,Datos: STD_LOGIC_VECTOR(15 downto 0);
   signal IOM, WR: STD_LOGIC;
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;


begin

   -- Instantiate the Unit Under Test (UUT)
   uut: PuertoEntrada port map (Direccion,Entrada,Datos,IOM,WR,clk );

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
clock_process : process
begin
   while (clock_on) loop
      clk <= '0';
      wait for clock_period/2;
      clk <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;

   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------

   -- Test case 1
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ns;
   -- assert (<condition>) report "Error case 1" severity error;

   -- Test case 2
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ns;
   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
