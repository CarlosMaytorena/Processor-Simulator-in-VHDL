-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 20:17:59
-- Project Name:   MemoriadeControl
-- Module Name:    MemoriadeControl_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity MemoriadeControl_tb is
end    MemoriadeControl_tb;

architecture Testbench of MemoriadeControl_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component MemoriadeControl
      port(COOP: in STD_LOGIC_VECTOR(11 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   clk: in STD_LOGIC
		   );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: MemoriadeControl use entity WORK.MemoriadeControl(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal COOP: STD_LOGIC_VECTOR(11 downto 0);
   signal Salida: STD_LOGIC_VECTOR(15 downto 0);
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: MemoriadeControl port map (COOP,Salida,clk);

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
--   wait for 100 ns;
	COOP<="101110010000";

   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------

   -- Test case 1
   -- ... Asignaciones a seniales de entrada ...
   wait for 400 ns;
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
