 ----------------------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.numeric_std.all;
 ----------------------------------------------------------
 ENTITY teste IS
 PORT (clk, rst: IN STD_LOGIC;
 x: IN std_logic_vector(1 downto 0);
 y: OUT std_logic_vector(1 downto 0));
 END teste;
 ----------------------------------------------------------
 ARCHITECTURE v1 OF teste IS
 TYPE state IS (A, B, C);
 SIGNAL pr_state, nx_state: state;
 ATTRIBUTE ENUM_ENCODING: STRING; --optional attribute
 ATTRIBUTE ENUM_ENCODING OF state: TYPE IS "sequential";
 BEGIN
 ------Lower section of FSM:------------
 PROCESS (clk, rst)
 BEGIN
	IF (rst='1') THEN
		pr_state <= A;
	ELSIF (clk'EVENT AND clk='1') THEN
		pr_state <= nx_state;
	END IF;
 END PROCESS;
 ------Upper section of FSM:------------
 PROCESS (pr_state, x)
 BEGIN
	CASE pr_state IS
		WHEN A =>
			y <= std_logic_vector(to_signed(0,2));
			IF (x=std_logic_vector(to_signed(2,2))) THEN
				nx_state <= B;
			ELSE
				nx_state <= A;
			END IF;
		WHEN B =>
			y <= std_logic_vector(to_signed(0,2));
			IF (x=std_logic_vector(to_signed(0,2))) THEN
				nx_state <= C;
			ELSE
				nx_state <= B;
			END IF;
		WHEN C =>
			y <= std_logic_vector(to_signed(1,2));
			IF (x=std_logic_vector(to_signed(1,2))) THEN
				nx_state <= A;
			ELSE
				nx_state <= C;
			END IF;
		END CASE;
 END PROCESS;
-- ------Output section (optional):-------
-- PROCESS (clk, rst)
-- BEGIN
-- IF (rst='1') THEN
-- new_output <= <value>;
-- ELSIF (clk'EVENT AND clk='1') THEN --or clk='0'
-- new_output <= y;
-- END IF;
-- END PROCESS;
END v1;
----------------------------------------------------------
