-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: Carlos Maytorena
-- 
-- Create Date:    15/04/2020 12:00:46
-- Project Name:   Control01
-- Module Name:    Control01.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned
use work.Circuitos.all;

entity Control01 is
   port(Teclado: in STD_LOGIC_VECTOR(15 downto 0);
		Display: out STD_LOGIC_VECTOR(15 downto 0);
		MMBR: inout STD_LOGIC_VECTOR(1 downto 0);
		IncPC,LPC,LPAR,LIR,LPBR,LMAR,RW,BMBR,LMBR,LR1,LR2,LR3,LRF: inout STD_LOGIC:= '0';
		clk: in STD_LOGIC
	 	);

end Control01;

architecture arq1 of Control01 is

signal salidaPC,EntradaROM,salidaMAR: STD_LOGIC_VECTOR(8 downto 0):= '0' & x"00";
signal salidaIR,salidaPBR,SalidaROM: STD_LOGIC_VECTOR(11 downto 0):= x"000";
signal SControl,concatenado,salidaRAM,salidaALU,salidaPE,salidaPS: STD_LOGIC_VECTOR(15 downto 0):=x"0000";
signal IOM: STD_LOGIC:='0';
signal SRF: STD_LOGIC_VECTOR(2 downto 0);
signal comp: STD_LOGIC:='0';

begin

LPAR<=SControl(14);
IncPC<=SControl(13);
LPC<=SControl(12) and comp;
LPBR<=SControl(11);
LIR<=SControl(10);
LMAR<=SControl(9);
RW<=SControl(8);
BMBR<=SControl(7);
MMBR<=SControl(6 downto 5);
LMBR<=SControl(4);
LR1<=SControl(3);
LR2<=SControl(2);
LR3<=SControl(1);
LRF<=SControl(0);

IOM<=salidaIR(11) and salidaIR(10) and not salidaIR(9) and not salidaIR(8);

comp<= (not salidaIR(7) and not salidaIR(6) and SRF(2)) or (not salidaIR(7) and salidaIR(6) and SRF(1)) or (salidaIR(7) and not salidaIR(6) and SRF(0));

PC : Contador9 port map(salidaPBR(8 downto 0),salidaPC,IncPC,LPC,clk);
PAR : Registro9 port map(salidaPC,EntradaROM,LPAR,clk);
IR : Registro12 port map(salidaPBR,salidaIR,LIR,clk);
PBR : Registro12 port map(SalidaROM,salidaPBR,LPBR,clk);
ROM : ROM_Programa port map(EntradaROM,SalidaROM);
MAR : Registro9 port map(SalidaROM(8 downto 0),salidaMAR,LMAR,clk);
Control : MemoriadeControl port map(salidaIR,SControl,clk);

concatenado<=salidaIR(3 downto 0) & salidaPBR;
ALU : CircuitoALU port map(salidaIR,salidaRAM,concatenado,salidaPE,salidaALU,MMBR,LMBR,LR1,LR2,LR3,LRF,BMBR,SRF,clk);
RAMon : RAM port map(salidaMAR,salidaALU,salidaRAM,RW,IOM);

Entrada : PuertoEntrada port map(salidaMAR,Teclado,salidaPE,IOM,RW,clk);
Salida : PuertoSalida port map(salidaMAR,salidaALU,salidaPS,IOM,RW,clk);

Display<=salidaPS;

end arq1;
