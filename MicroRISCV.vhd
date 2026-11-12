----------------------------------------------------------------------
----------------------------------------------------------------------
-- Asignatura: Estructura de Computadores.
-- Fichero: MicroRISCV.vhd
-- Descripción: Diseño del microprocesador RISC-V
-- Fichero de apoyo para: Práctica: 4. Ejercicio: 4
----------------------------------------------------------------------
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MicroRISCV is	port (
	Clk : in std_logic; -- Reloj
	NRst : in std_logic; -- Reset activo a nivel bajo
	MemProgAddr : out unsigned(31 downto 0); -- Dirección para la memoria de programa
	MemProgData : in unsigned(31 downto 0); -- Código de operación
	MemDataAddr : out unsigned(31 downto 0); -- Dirección para la memoria de datos
	MemDataDataRead : in signed(31 downto 0); -- Dato a leer en la memoria de datos
	MemDataDataWrite : out signed(31 downto 0); -- Dato a guardar en la memoria de datos
	MemDataWE : out std_logic
	);
end MicroRISCV;
 
architecture Practica4 OF MicroRISCV is
 
	signal Instr_Sig : signed(31 downto 0);
	signal Instr_Slv : std_logic_vector(31 downto 0);
	
begin

	Instr_Slv <= std_logic_vector(MemProgData);
	Instr_Sig <= signed(MemProgData);

	------------------------------------------------------
	-- Instanciar los componentes usados
	------------------------------------------------------
	
	
	GPR: RegsRISCV port map (
		);

	ALU: ALURISCV port map (
		);

	UC: UnidadControl port map (
		);

	ES: ExtSignoRISCV port map(
		);
	
	
	
	
	-- Diseño del MUX para la entrada ALUB
	
	
	-- Diseño del MUX para la entrada WD3
	
		
	-- Señales para el salto incondicional
	
	
	-- Señales de acceso a la memoria de datos
	
	
	-- Diseño de la ruta del PC
	
	

end Practica4;