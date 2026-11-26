----------------------------------------------------------------------
----------------------------------------------------------------------
-- Asignatura: Estructura de Computadores.
-- Fichero: ExtSignoRISCV.vhd
-- Descripción: Diseño de la extensión de signo del microprocesador RISC-V
----------------------------------------------------------------------
----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ExtSignoRISCV is
    Port (
        Instr_Sig : in  signed(31 downto 0);
        ImmSrc    : in  std_logic_vector(1 downto 0);
        ExtSigno  : out signed(31 downto 0)
    );
end ExtSignoRISCV;

architecture behavior of ExtSignoRISCV is
begin

	process(all)
	begin
		case ImmSrc is
			when "00" =>
				ExtSigno <= (19 downto 0 => Instr_Sig(31)) & Instr_Sig(31 downto 20);
			when "01" =>
				ExtSigno <= (19 downto 0 => Instr_Sig(31)) & Instr_Sig(31 downto 25) & Instr_Sig(11 downto 7);
			when "10" =>
				ExtSigno <= (18 downto 0 => Instr_Sig(31)) & Instr_Sig(31) & Instr_Sig(7) & Instr_Sig(30 downto 25) & Instr_Sig(11 downto 8) & '0';
			when others =>
				ExtSigno <= (10 downto 0 => Instr_Sig(31)) & Instr_Sig(31) & Instr_Sig(19 downto 12) & Instr_Sig(20) & Instr_Sig(30 downto 21) & '0';
		end case;
	end process;
end behavior;
