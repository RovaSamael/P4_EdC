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




end behavior;
