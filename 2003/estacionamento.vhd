 ----------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 -------------------------------------------------------------------
 ENTITY estacionamento IS
 PORT (vagas_bit: IN bit_vector (4 downto 0);
		 vagas_int: OUT integer range 0 to 5);
 END estacionamento;
 -------------------------------------------------------------------
 ARCHITECTURE estacionamento OF estacionamento IS
	signal x: bit;
	signal y: integer;
 FUNCTION "+" (y: integer; x: bit) RETURN INTEGER IS
	BEGIN
		IF (x='1') THEN RETURN y+1;
		ELSE RETURN y;
	END IF;
 END "+";
 BEGIN
	vagas_int<=0+vagas_bit(0)+vagas_bit(1)+vagas_bit(2)+vagas_bit(3)+vagas_bit(4); --declaramos a sobrecarga de 
																											 --soma '+' para int e bit, por isso iniciamos a soma com 0;
 END architecture;
 -------------------------------------------------------------------
 