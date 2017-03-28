library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFDCLR is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end FFDCLR;

architecture Behavioral of FFDCLR is

signal aux : std_logic := '0';

begin
	
	with CLR select
		Q <= '0' when '1',
			  aux when Others;
			  
	process (CLK)
	begin
	
		if CLK'event and CLK='1' then 
			if CLR = '1' then
				aux <= '0';
			else
				aux <= D;
			end if;
		end if;
	end process;


end Behavioral;

