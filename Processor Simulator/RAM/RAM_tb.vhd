-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 23:21:32
-- Project Name:   RAM
-- Module Name:    RAM_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity RAM_tb is
end    RAM_tb;

architecture Testbench of RAM_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component RAM
      port(D: in STD_LOGIC_VECTOR(8 downto 0);
--		   P: inout STD_LOGIC_VECTOR( 15 downto 0);
		   Pin: in STD_LOGIC_VECTOR(15 downto 0);
		   Pout: out STD_LOGIC_VECTOR(15 downto 0);
		   RW,IOM: in STD_LOGIC
		   );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: RAM use entity WORK.RAM(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
--   signal   <clock> : std_logic := '0';
--   constant clock_period : time := 50 ns;
--   signal   clock_on : boolean := true;

   signal D: STD_LOGIC_VECTOR(8 downto 0);
--   signal P: STD_LOGIC_VECTOR( 15 downto 0);
   signal Pin,Pout: STD_LOGIC_VECTOR(15 downto 0);
   signal RW,IOM: STD_LOGIC;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RAM port map (D,Pin,Pout,RW,IOM );

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
--clock_process : process
--begin
--   while (clock_on) loop
--      <clock> <= '0';
--      wait for clock_period/2;
--      <clock> <= '1';
--      wait for clock_period/2;
--   end loop;
--   --assert (false) report ("Finished") severity error;
--   -- Wait forever
--   wait;
-- end process;

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
--   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
