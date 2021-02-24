-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    20/04/2020 22:12:22
-- Project Name:   ALU
-- Module Name:    ALU_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity ALU_tb is
end    ALU_tb;

architecture Testbench of ALU_tb is

   component ALU
      port(OP: in STD_LOGIC_VECTOR(3 downto 0);
		   A,B: in STD_LOGIC_VECTOR(15 downto 0);
		   R: out STD_LOGIC_VECTOR(15 downto 0);
    	   F: out STD_LOGIC_VECTOR(2 downto 0)
		   );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: ALU use entity WORK.ALU(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
--   signal   <clock> : std_logic := '0';
--   constant clock_period : time := 50 ns;
--   signal   clock_on : boolean := true;

	signal OP: STD_LOGIC_VECTOR(3 downto 0);
	signal A,B: STD_LOGIC_VECTOR(15 downto 0);
	signal R: STD_LOGIC_VECTOR(15 downto 0);
    signal F: STD_LOGIC_VECTOR(2 downto 0);


begin

   -- Instantiate the Unit Under Test (UUT)
   uut: ALU port map (OP,A,B,R,F);

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

	A<=x"0001";
	B<=x"0005";
	OP<="0010";

   wait for 100 ns;

	A<=x"0001";
	B<=x"0001";
	OP<="0010";

   wait for 100 ns;

	A<=x"0002";
	B<=x"0001";
	OP<="0011";

   wait for 100 ns;
   wait;

end process;

end Testbench;
