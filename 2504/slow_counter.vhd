 ------------------------------------------------------
 ENTITY slow_counter IS
	 GENERIC (fclk: INTEGER := 50); --50MHz
	 PORT (clk, rst: IN BIT;
	 ssd: OUT BIT_VECTOR(6 DOWNTO 0);
	 ssd2: OUT BIT_VECTOR(6 DOWNTO 0));
 END ENTITY;
 ------------------------------------------------------
 ARCHITECTURE counter OF slow_counter IS
	signal segundo: NATURAL RANGE 0 TO 10 := 0;
	signal terceiro: NATURAL RANGE 0 TO 10 := 0;
	 BEGIN
	 PROCESS (clk, rst)
	 VARIABLE counter1: NATURAL RANGE 0 TO fclk := 0;
	 VARIABLE counter2: NATURAL RANGE 0 TO 10 := 0;
	 BEGIN
	 ------counter:---------
	 
	 IF (rst='1') THEN
		 counter1 := 0;
		 counter2 := 0;
	 ELSIF (clk'EVENT AND clk='1') THEN
		 counter1 := counter1 + 1;
		 IF (counter1=fclk) THEN
			 counter1 := 0;
			 counter2 := counter2 + 1;
			 IF (counter2=7) THEN
				 counter2 := 0;
			 END IF;
		 END IF;
	 END IF;

	segundo <= counter2;
	 END PROCESS;
	 
	 -----------------------------------------------------
	 
	 PROCESS (clk, rst)
	 VARIABLE counter1: NATURAL RANGE 0 TO fclk := 0;
	 VARIABLE counter2: NATURAL RANGE 0 TO 10 := 0;
	 VARIABLE counter3: NATURAL RANGE 0 TO 60 := 0;
	 BEGIN
	 ------counter:---------
	 IF (rst='1') THEN
		 counter1 := 0;
		 counter2 := 0;
		 counter3 := 0;
	 ELSIF (clk'EVENT AND clk='1') THEN
		 counter1 := counter1 + 1;
		 IF (counter1=fclk/9) THEN
			 counter1 := 0;
			 counter2 := counter2 + 1;
			 counter3 := counter3 +1;
			 if (counter3=60) then
				counter1 := 0;
				counter2 := 0;
				counter3 := 0;
				 IF (counter2=10) THEN
					 counter2 := 0;
				 END IF;
			 end if;
		 END IF;
	 END IF;
	terceiro <= counter2;
	 END PROCESS;
	 
	 ----------------------------------------------
	 
	 with segundo select
	 ssd <= 
				"0000001" when 0,
				"1001111" when 1,
				"0010010" when 2,
				"0000110" when 3,
				"1001100" when 4,
				"0100100" when 5,
				"0100000" when 6,
				"0001111" when 7,
				"0000000" when 8,
				"0000100" when 9,
				"0110000" when others;
 
 	 with terceiro select
	 ssd2 <= 
				"0000001" when 0,
				"1001111" when 1,
				"0010010" when 2,
				"0000110" when 3,
				"1001100" when 4,
				"0100100" when 5,
				"0100000" when 6,
				"0001111" when 7,
				"0000000" when 8,
				"0000100" when 9,
				"0110000" when others;
 
 END ARCHITECTURE;
 ------------------------------------------------------
