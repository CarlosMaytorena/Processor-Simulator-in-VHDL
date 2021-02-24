-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    15/04/2020 12:00:46
-- Project Name:   Control01
-- Module Name:    Control01_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Control01_tb is
end    Control01_tb;

architecture Testbench of Control01_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Control01
   port(Teclado: in STD_LOGIC_VECTOR(15 downto 0);
		Display: out STD_LOGIC_VECTOR(15 downto 0);
		MMBR: inout STD_LOGIC_VECTOR(1 downto 0);
		IncPC,LPC,LPAR,LIR,LPBR,LMAR,RW,BMBR,LMBR,LR1,LR2,LR3,LRF: inout STD_LOGIC;
		clk: in STD_LOGIC
	 	);
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: Control01 use entity WORK.Control01(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal Teclado,Display: STD_LOGIC_VECTOR(15 downto 0);
--   signal Salida: STD_LOGIC_VECTOR(8 downto 0);
   signal MMBR: STD_LOGIC_VECTOR(1 downto 0);
   signal IncPC,LPC,LPAR,LIR,LPBR,LMAR,RW,BMBR,LMBR,LR1,LR2,LR3,LRF: STD_LOGIC:= '0';
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Control01 port map (Teclado,Display,MMBR,IncPC,LPC,LPAR,LIR,LPBR,LMAR,RW,BMBR,LMBR,LR1,LR2,LR3,LRF,clk );

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

	Teclado <= x"0055";
--   wait for 50 ns;  --- T1	
--	LPAR <= '1';
--   wait for 50 ns;  --- T2
--	LPBR <= '1';
--	LPAR <= '0';
--	IncPC <= '1';
--   wait for 50 ns; --- T3
--	LPBR <= '0';
--	IncPC <= '0';
--	LIR <= '1';
--   wait for 50 ns; --- T4
--	LIR <= '0';
--	LPAR <= '1';
--   wait for 50 ns; --- T5
	
   wait for 100 ns;

   wait for 20000 ns;
 
   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
