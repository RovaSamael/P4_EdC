----------------------------------------------------------------------
----------------------------------------------------------------------
-- Asignatura: Estructura de Computadores.
-- Fichero: MemProgRISCV.vhd
-- Descripción: Memoria de programa para el RISC-V
-- Fichero de apoyo para: Práctica: 4. Ejercicio: 1. Se utiliza en la validación del Ejercicio 3
----------------------------------------------------------------------
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity MemProgRISCV is										
	port (
		MemProgAddr : in unsigned(31 downto 0);        		-- Dirección para la memoria de programa
		MemProgData : out unsigned(31 downto 0) 			-- Instrucción
	);
end MemProgRISCV;											

architecture Simple of MemProgRISCV is	

begin

	-- Proceso para la escritura inicial en la memoria de código o de programa. 
	-- La memoria de programa es de solo lectura, el proceso de escritura es único y se realiza antes de ejecutar la simulación.  
	EscrituraMemProg: process(all)
	begin
		-- La memoria devuelve un valor para cada dirección.
		-- Estos valores son los códigos de programa de cada instrucción, estando situado cada uno en su dirección.
		-- Código para la escritura de los datos iniciales quedeben ser cargados previamente en memoria antes de la ejecución del programa.
		
		-- Se cargan a partir de una dirección dada, en RARS por la directiva .text, que en el ejemplo es 0x00000000.
		-- Como cada instruccción ocupa 4 bytes, las direcciones se incrementan de 4 en 4. 
			
		case MemProgAddr is
-- *********************************************************************
			when x"00000000" => MemProgData <= x"00002097";		-- la x1, datoA 
			when x"00000004" => MemProgData <= x"00008093";		-- la x1, datoA
			when x"00000008" => MemProgData <= x"00400113";		-- addi x2, x0, 4
			when x"0000000C" => MemProgData <= x"00f06193";		-- ori x3, x0, 15
			when x"00000010" => MemProgData <= x"0041f213";		-- andi x4, x3, 4
			when x"00000014" => MemProgData <= x"fec20293";		-- addi x5, x4, -20
			when x"00000018" => MemProgData <= x"7ff02313";		-- slti x6, x0, 0x7FF
			when x"0000001C" => MemProgData <= x"fff02313"; 	-- slti x6, x0, -1
			when x"00000020" => MemProgData <= x"0022a3b3";		-- slt x7, x5, x2
			when x"00000024" => MemProgData <= x"0000a403";		-- lw x8, 0(x1)
			when x"00000028" => MemProgData <= x"0040a483";		-- lw x9, 4(x1)
			when x"0000002C" => MemProgData <= x"0080a503";		-- lw x10, 8(x1)
			when x"00000030" => MemProgData <= x"408385b3";		-- sub x11, x7, x8
			when x"00000034" => MemProgData <= x"00510463";		-- beq x2, x5, nosalta
			when x"00000038" => MemProgData <= x"00a48463";		-- beq x9, x10, salta
			when x"0000003C" => MemProgData <= x"000005b3";		-- add x11, x0, x0
			when x"00000040" => MemProgData <= x"00258613";		-- addi x12, x11, 2
			when x"00000044" => MemProgData <= x"002006b3";		-- add x13, x0, x2
			when x"00000048" => MemProgData <= x"00d0a623";		-- sw x13, 12(x1)
			when x"0000004C" => MemProgData <= x"00c0a703";		-- lw x14, 12(x1)
			when x"00000050" => MemProgData <= x"fff14793";		-- xori x15, x2, -1
			when x"00000054" => MemProgData <= x"00e74133";		-- xor x2, x14, x14
			when x"00000058" => MemProgData <= x"0007f7b3";		-- and x15, x15, x0
			when x"0000005C" => MemProgData <= x"0041e833";		-- or x16, x3, x4
			when x"00000060" => MemProgData <= x"01384893";		-- xori x17, x16, 0x13
			when x"00000064" => MemProgData <= x"00C000ef";		-- jal fun
			when x"00000068" => MemProgData <= x"07400913";		-- addi x18, x0, 0x74
			when x"0000006C" => MemProgData <= x"00090fe7";		-- jalr x31, x18, 0
			when x"00000070" => MemProgData <= x"00008067";		-- jr ra
			when x"00000074" => MemProgData <= x"0000006F";		-- j fin
			
-- *********************************************************************			
			when others => MemProgData <= x"00000000"; -- Resto de memoria vacía
		end case;
	end process EscrituraMemProg;

	
	
end Simple;

