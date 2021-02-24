-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 01:21:44
-- Project Name:   Registro2
-- Module Name:    Registro2_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Registro2_tb is
end    Registro2_tb;

architecture Testbench of Registro2_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Registro2
      port(Entrada: in STD_LOGIC_VECTOR(2 downto 0);
		   Salida: out STD_LOGIC_VECTOR(2 downto 0);
		   L: in STD_LOGIC;
		   clk: in std_logic
		   );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: IR use entity WORK.IR(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal Entrada: STD_LOGIC_VECTOR(2 downto 0);
   signal Salida: STD_LOGIC_VECTOR(2 downto 0);
   signal L: STD_LOGIC;
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;


begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Registro2 port map (Entrada,Salida,L,clk);

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
   wait for 100 ns;

	Entrada <= "001";
	L <= '1';

   wait for 100 ns;

	Entrada <= "000";
	L <= '0';

   wait for 100 ns;

	Entrada <= "100";
	L <= '1';

   -- Stop clock
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
