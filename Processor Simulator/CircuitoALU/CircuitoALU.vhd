-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    01/06/2020 00:14:52
-- Project Name:   CircuitoALU
-- Module Name:    CircuitoALU.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity CircuitoALU is
   port(COOP: in STD_LOGIC_VECTOR(11 downto 0);
		SRAM,SPBR,SP: in STD_LOGIC_VECTOR(15 downto 0);
		Salida: out STD_LOGIC_VECTOR(15 downto 0);
		MMBR: in STD_LOGIC_VECTOR(1 downto 0);
		LMBR,LR1,LR2,LR3,LRF,MBRM: in STD_LOGIC;
		SRF: out STD_LOGIC_VECTOR(2 downto 0):="000";
		clk: in STD_LOGIC
		);
end CircuitoALU;

architecture arq1 of CircuitoALU is

   component ALU
      port(OP: in STD_LOGIC_VECTOR(3 downto 0);
		   A,B: in STD_LOGIC_VECTOR(15 downto 0);
		   R: out STD_LOGIC_VECTOR(15 downto 0);
    	   F: out STD_LOGIC_VECTOR(2 downto 0)
		   );
   end component;

   component Multiplexor
      port(Entrada1,Entrada2,Entrada3,Entrada4: in STD_LOGIC_VECTOR(15 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   Selector: in STD_LOGIC_VECTOR(1 downto 0)
		   );
   end component;

   component Registro16
      port(Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   L: in STD_LOGIC;
		   clk: in std_logic
		   );
   end component;

   component Registro2
      port(Entrada: in STD_LOGIC_VECTOR(2 downto 0);
		   Salida: out STD_LOGIC_VECTOR(2 downto 0);
		   L: in STD_LOGIC;
		   clk: in std_logic
		   );
   end component;

   component Buf
      port(Entrada: in STD_LOGIC_VECTOR(15 downto 0);
		   Salida: out STD_LOGIC_VECTOR(15 downto 0);
		   Control: in STD_LOGIC
		   );
   end component;

signal SALU,SMM,SMBR,SR1,SR2,SR3,SMA,SMB: STD_LOGIC_VECTOR(15 downto 0);
signal SF: STD_LOGIC_VECTOR(2 downto 0);
--signal LMBR,LR1,LR2,LR3,LRF: STD_LOGIC;
signal SelectorMA: STD_LOGIC_VECTOR(1 downto 0);

begin

--LMBR<= not (COOP(5) and COOP(4));
--LR1<= not COOP(5) and COOP(4);
--LR2<= COOP(5) and not COOP(4);
--LR3<= COOP(5) and COOP(4);

with COOP(11 downto 7) select
	SelectorMA<= COOP(3 downto 2) when "11000",
				 COOP(5 downto 4) when others;

MM: Multiplexor port map(SRAM,SPBR,SALU,SP,SMM,MMBR);
MBR: Registro16 port map(SMM,SMBR,LMBR,clk);
R1: Registro16 port map(SALU,SR1,LR1,clk);
R2: Registro16 port map(SALU,SR2,LR2,clk);
R3: Registro16 port map(SALU,SR3,LR3,clk);
MA: Multiplexor port map(SMBR,SR1,SR2,SR3,SMA,SelectorMA);
MB: Multiplexor port map(SMBR,SR1,SR2,SR3,SMB,COOP(3 downto 2));
ALU_2: ALU port map(COOP(11 downto 8),SMA,SMB,SALU,SF);
RF: Registro2 port map(SF,SRF,LRF,clk);
Bufer: Buf port map(SMBR,Salida,MBRM);

end arq1;
