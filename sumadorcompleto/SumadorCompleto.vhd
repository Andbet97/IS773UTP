library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumadorCompleto is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           s : out  STD_LOGIC);
end SumadorCompleto;

architecture Behavioral of SumadorCompleto is

	signal s1 : std_logic := '0';
	signal co1 : std_logic := '0';
	signal co2 : std_logic := '0';
	
begin

	s1 <= a xor b;
	co1 <= a and b;
	
	s <= s1 xor cin;
	co2 <= s1 and cin;
	
	cout <= co2 xor co1;
	

end Behavioral;

