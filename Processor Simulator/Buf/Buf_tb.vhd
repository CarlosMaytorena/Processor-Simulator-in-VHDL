-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 19:17:25
-- Project Name:   Buf
-- Module Name:    Buf_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Buf_tb is
end    Buf_tb;

architecture Testbench of Buf_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Buf
      port(Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   Control: in STD_LOGIC
		   );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: Buffer use entity WORK.Buffer(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
--   signal   <clock> : std_logic := '0';
--   constant clock_period : time := 50 ns;
--   signal   clock_on : boolean := true;
   signal Entrada,Salida: STD_LOGIC_VECTOR(15 downto 0);
   signal Control: STD_LOGIC;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Buf port map (Entrada,Salida,Control );

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
	Entrada<=x"0021";
	Control<='0';
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
