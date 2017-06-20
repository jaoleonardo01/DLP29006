----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
----------------------------------------------------------
ENTITY fsm IS
	PORT (
		clk, rst : IN STD_LOGIC;
		vd, vm, am: OUT STD_LOGIC_vector(2 downto 0);
		rst_count : OUT STD_LOGIC_vector(7 downto 0)
	);
END entity;
----------------------------------------------------------
ARCHITECTURE v1 OF fsm IS
	TYPE state IS (st0, st1, st2, st3, st4, st5);
	SIGNAL pr_state, nx_state : state;
	SIGNAL counter : integer;
	ATTRIBUTE enum_encoding : STRING; --optional attribute
	ATTRIBUTE enum_encoding OF state : TYPE IS "sequential";
BEGIN
	----Lower section of FSM:-----------
	PROCESS (rst, clk)
	BEGIN
		IF (rst = '1') THEN
			pr_state <= st0;
		ELSIF (clk'EVENT AND clk = '1') THEN
			pr_state <= nx_state;
			counter<=counter + 1;
		END IF;
	END PROCESS;
	----Upper section of FSM:-----------
	PROCESS (pr_state)
		BEGIN
			CASE pr_state IS
				WHEN st0 => 
					vd <= '100';
					vm <= '011';
					am <= '000';
					IF (counter=28) THEN
						nx_state <= st1;
					END IF;
				WHEN st1 => 
					vd <= '000';
					vm <= '011';
					am <= '100';
					IF (counter=30) THEN
						nx_state <= st2;
					END IF;
				WHEN st2 => 
					candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';	
					IF (nickel_in) THEN
						nx_state <= st15;
					ELSIF (dime_in) THEN
						nx_state <= st20;
					ELSIF (quarter_in) THEN
						nx_state <= st35;
					ELSE
						nx_state <= st10;
					END IF;
				WHEN st15 => 
					candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';
					IF (nickel_in) THEN
						nx_state <= st20;
					ELSIF (dime_in) THEN
						nx_state <= st25;
					ELSIF (quarter_in) THEN
						nx_state <= st40;
					ELSE
						nx_state <= st15;
					END IF;
				WHEN st20 => 
					candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';
					IF (nickel_in) THEN
						nx_state <= st25;
					ELSIF (dime_in) THEN
						nx_state <= st30;
					ELSIF (quarter_in) THEN
						nx_state <= st45;
					ELSE
						nx_state <= st20;
					END IF;
				WHEN st25 => 
					candy_out <= '1';
					nickel_out <= '0';
					dime_out <= '0';
					nx_state <= st0;
				WHEN st30 => 
					candy_out <= '1';
					nickel_out <= '1';
					dime_out <= '0';
					nx_state <= st0;
				WHEN st35 => 
					candy_out <= '1';
					nickel_out <= '0';
					dime_out <= '1';
					nx_state <= st0;
				WHEN st40 => 
					candy_out <= '0';
					nickel_out <= '1';
					dime_out <= '0';
					nx_state <= st35;
				WHEN st45 => 
					candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '1';
					nx_state <= st35;
			END CASE;
		END PROCESS;
		END v1;
		----------------------------------------------------------