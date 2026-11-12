----------------------------------------------------------------------
----------------------------------------------------------------------
-- Asignatura: Estructura de Computadores.
-- Fichero: ExtSignoRISCVTb.vhd
-- Descripción: Testbench para la extensión de signo del microprocesador RISC-V
----------------------------------------------------------------------
----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ExtSignoRISCVTb is
end ExtSignoRISCVTb;

architecture Test of ExtSignoRISCVTb is

    -- Componente bajo prueba
    component ExtSignoRISCV is
        Port (
            Instr_Sig : in  signed(31 downto 0);
            ImmSrc    : in  std_logic_vector(1 downto 0);
            ExtSigno  : out signed(31 downto 0)
        );
    end component;

    -- Señales internas
    signal Instr_Sig : signed(31 downto 0);
    signal ImmSrc    : std_logic_vector(1 downto 0);
    signal ExtSigno  : signed(31 downto 0);

begin

    -- Instancia del módulo a probar
    UUT: ExtSignoRISCV
        port map (
            Instr_Sig => Instr_Sig,
            ImmSrc    => ImmSrc,
            ExtSigno  => ExtSigno
        );

        -- Proceso de estimulación
    process
    begin
        -- =======================================================
        -- Tipo I (Ejemplo de instrucciones tipo addi o lw)
        -- =======================================================
        report "======== PRUEBAS TIPO I ========";

        -- Inmediato positivo (+12)
        Instr_Sig <= x"00C08093"; -- addi x1, x1, 12
        ImmSrc    <= "00";
        wait for 10 ns;
        assert to_integer(ExtSigno) = 12
			report "Error: Tipo I (positivo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));

        -- Inmediato negativo (-8)
        Instr_Sig <= x"FF808093"; -- addi x1, x1, -8
        ImmSrc    <= "00";
        wait for 10 ns;
        assert to_integer(ExtSigno) = -8
			report "Error: Tipo I (negativo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));


        -- =======================================================
        -- Tipo S (Ejemplo de instrucciones tipo sw)
        -- =======================================================
        report "======== PRUEBAS TIPO S ========";

        -- Inmediato positivo (+16)
        Instr_Sig <= x"01012823"; -- sw x16, 16(x2)
        ImmSrc    <= "01";
        wait for 10 ns;
        assert to_integer(ExtSigno) = 16
			report "Error: Tipo S (positivo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));

        -- Inmediato negativo (-20)
        Instr_Sig <= x"FEC12623"; -- sw x12, -20(x2)
        ImmSrc    <= "01";
        wait for 10 ns;
        assert to_integer(ExtSigno) = -20
			report "Error: Tipo S (negativo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));


        -- =======================================================
        -- Tipo B (Ejemplo de instrucciones tipo beq)
        -- =======================================================
        report "======== PRUEBAS TIPO B ========";

        -- Inmediato positivo (+8)
        Instr_Sig <= x"00850463"; -- beq x10, x8, +8
        ImmSrc    <= "10";
        wait for 10 ns;
        assert to_integer(ExtSigno) = 8
			report "Error: ipo B (positivo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));

        -- Inmediato negativo (-12)
        Instr_Sig <= x"FED78AE3"; -- beq x15, x13, -12
        ImmSrc    <= "10";
        wait for 10 ns;
        assert to_integer(ExtSigno) = -12
			report "Error: Tipo B (negativo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));


        -- =======================================================
        -- Tipo J (Ejemplo de instrucciones tipo jal)
        -- =======================================================
        report "======== PRUEBAS TIPO J ========";

        -- Inmediato positivo (+32)
        Instr_Sig <= x"020000EF"; -- jal x1, +32
        ImmSrc    <= "11";
        wait for 10 ns;
        assert to_integer(ExtSigno) = 32
			report "Error: Tipo J (positivo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));

        -- Inmediato negativo (-24)
        Instr_Sig <= x"FEDFF0EF"; -- jal x1, -20
        ImmSrc    <= "11";
        wait for 10 ns;
        assert to_integer(ExtSigno) = -20
			report "Error: Tipo J (negativo) -> ExtSigno = " & integer'image(to_integer(signed(ExtSigno)));

		report "Simulacion finalizada. Comprueba si hay errores previos.";
        wait;
    end process;
    
end Test;
