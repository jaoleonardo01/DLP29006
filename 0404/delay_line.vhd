 ---------------------------------------------
 ENTITY delay_line IS
 PORT (x: IN BIT;
 y: OUT BIT);
 END ENTITY;
 ---------------------------------------------
 ARCHITECTURE example OF delay_line IS
 SIGNAL a1, a2, b1,b2,c1,c2,y1,y2: BIT;
 ATTRIBUTE keep: BOOLEAN;
 ATTRIBUTE keep OF a1, a2, b1,b2,c1,c2,y1,y2: SIGNAL IS TRUE;
 BEGIN
 a1 <= NOT x;
 a2 <= NOT a1;
 b2 <= NOT a2;
 c2 <= NOT b2;
 y2 <= c2 and a1;
 
 b1<= NOT a1;
 c1<= NOT b1;
 y1 <= x and c1;
 
 y<=y1 or y2;
 END ARCHITECTURE;
 ---------------------------------------------
