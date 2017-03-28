library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumador4bits is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
			  B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout : out STD_LOGIC);
end Sumador4bits;

architecture Behavioral of Sumador4bits is

	COMPONENT SumadorCompleto
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		cin : IN std_logic;          
		cout : OUT std_logic;
		s : OUT std_logic
		);
	END COMPONENT;
	
	signal co1: std_logic := '0';
	signal co2: std_logic := '0';
	signal co3: std_logic := '0';

begin

	Inst_SumadorCompleto0: SumadorCompleto PORT MAP(
		a => A(0),
		b => B(0),
		cin => Cin,
		cout => co1,
		s => cout
	);
	
	Inst_SumadorCompleto1: SumadorCompleto PORT MAP(
		a => A(1),
		b => B(1),
		cin => co1,
		cout => co2,
		s => S(0)
	);
	
	Inst_SumadorCompleto2: SumadorCompleto PORT MAP(
		a => A(2),
		b => B(2),
		cin => co2,
		cout => co3,
		s => S(1)
	);
	
	Inst_SumadorCompleto3: SumadorCompleto PORT MAP(
		a => A(3),
		b => B(3),
		cin => co3,
		cout => S(3),
		s => S(2)
	);

end Behavioral;

