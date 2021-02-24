-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    15/04/2020 11:44:51
-- Project Name:   Contador9
-- Module Name:    Contador9_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Contador9_tb is
end    Contador9_tb;

architecture Testbench of Contador9_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Contador9
      port(Entrada: in STD_LOGIC_VECTOR(8 downto 0);
		   Salida: out STD_LOGIC_VECTOR(8 downto 0);
		   Inc, L, clk: in STD_LOGIC	   
		   );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: Contador9 use entity WORK.Contador9(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal Entrada: STD_LOGIC_VECTOR(8 downto 0);
   signal Salida: STD_LOGIC_VECTOR(8 downto 0);
   signal Inc, L: STD_LOGIC;
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Contador9 port map (Entrada,Salida,Inc,L,clk );

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

	Inc <= '1';
	L <= '0';
	Entrada <= '0' & x"03";   

   wait for 100 ns;

	Inc <= '0';
	L <= '1';
	Entrada <= '0' & x"07";   
   
   wait for 100 ns;

 

   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;