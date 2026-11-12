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
				if Instr_Sig(31) = '1' then 
					ExtSigno <= x"FFFFF" & Instr_Sig(31 downto 20);
				else
					ExtSigno <= x"00000" & Instr_Sig(31 downto 20);
				end if;
			when "01" =>
				if Instr_Sig(31) = '1' then 
					ExtSigno <= x"FFFFF" & Instr_Sig(31 downto 25) & Instr_Sig(11 downto 7);
				else
					ExtSigno <= x"00000" & Instr_Sig(31 downto 25) & Instr_Sig(11 downto 7);
				end if;
			when "10" =>
				if Instr_Sig(31) = '1' then 
					ExtSigno <= x"FFFFF" & Instr_Sig(31) & Instr_Sig(7) & Instr_Sig(30 downto 25) & Instr_Sig(11 downto 8);
				else
					ExtSigno <= x"00000" & Instr_Sig(31) & Instr_Sig(7) & Instr_Sig(30 downto 25) & Instr_Sig(11 downto 8);
				end if;
			when others =>
				if Instr_Sig(31) = '1' then 
					ExtSigno <= x"FFF" & Instr_Sig(31) & Instr_Sig(19 downto 12) & Instr_Sig(20) & Instr_Sig(30 downto 21);
				else
					ExtSigno <= x"000" & Instr_Sig(31) & Instr_Sig(19 downto 12) & Instr_Sig(20) & Instr_Sig(30 downto 21);
				end if;
		end case;
	end process;
end behavior;
