--------------------------------------------------------------------
----------------------------------------------------------------------
-- Asignatura: Estructura de Computadores.
-- Fichero: UnidadControl.vhd
-- Descripción: Unidad de Control para el microprocesador RISC-V
-- Fichero: Práctica: 4. Ejercicio: 3b
----------------------------------------------------------------------
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity UnidadControl is port(
		Op : in  std_logic_vector (6 downto 0); -- OPCode de la instrucción
		Funct3 : in std_logic_vector(2 downto 0); -- Funct3 de la instrucción
		Funct7_5 : in std_logic; -- Bit 5 de Funct7_5 de la instrucción
		
		-- Señales para el PC
		Zero : in std_logic;
		PCSrc : out  std_logic;
		Jalr : out std_logic;
		
		-- Señales para la memoria
		ResultSrc : out std_logic_vector(1 downto 0);
		MemWrite : out std_logic;
		
		-- Señales para la ALU
		ALUControl : out std_logic_vector (2 downto 0);
		ALUSrc : out std_logic;
		
		ImmSrc : out std_logic_vector(1 downto 0);
		
		-- Señales para el GPR
		RegWrite : out std_logic
        );
end UnidadControl;
 
architecture behavior of UnidadControl is
	signal jump, branch : std_logic;
begin
	
	
	
end behavior;

