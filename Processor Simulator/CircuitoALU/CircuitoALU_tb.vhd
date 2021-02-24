-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 00:14:52
-- Project Name:   CircuitoALU
-- Module Name:    CircuitoALU_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity CircuitoALU_tb is
end    CircuitoALU_tb;

architecture Testbench of CircuitoALU_tb is

   -- Component Declaration for the Unit Under Test (UUT)
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

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: CircuitoALU use entity WORK.CircuitoALU(arq1);

   -- Inputs/Outputs
   -- signal ...

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal COOP: STD_LOGIC_VECTOR(11 downto 0);
   signal SRAM,SPBR,SP,Salida: STD_LOGIC_VECTOR(15 downto 0);
   signal MMBR: STD_LOGIC_VECTOR(1 downto 0);
   signal LMBR,LR1,LR2,LR3,LRF,MBRM: STD_LOGIC;
   signal SRF: STD_LOGIC_VECTOR(2 downto 0);
   signal   clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: CircuitoALU port map (COOP,SRAM,SPBR,SP,Salida,MMBR,LMBR,LR1,LR2,LR3,LRF,MBRM,SRF,clk );

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
	SRAM<=x"0011";
	SPBR<=x"0007";
	MMBR<="00";
	LMBR<='1';
	COOP<="101110010000";
	LR1<='1';
   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------
   wait for 75 ns;
	COOP<="000110010000";
	MMBR<="01";
   wait for 50 ns;
	COOP<="010010010000";
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
