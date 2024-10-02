LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY adderTree IS
    GENERIC (N:POSITIVE := 8);
    PORT (a,b,c,d:IN std_logic_vector(N-1 DOWNTO 0);
          s:OUT std_logic_vector(N+1 DOWNTO 0)
    );
END adderTree;

ARCHITECTURE arch OF adderTree IS
BEGIN
    -- Redimensionamento das entradas e soma combinacional
    s <= std_logic_vector(resize(unsigned(a), N+2) 
	        +resize(unsigned(b), N+2)
		+resize(unsigned(c), N+2)
		+resize(unsigned(d), N+2)
     );
END arch;
