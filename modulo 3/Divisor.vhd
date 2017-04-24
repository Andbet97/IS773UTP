library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Divisor is
    Port ( clk : in  STD_LOGIC;
           newC : out  STD_LOGIC);
end Divisor;

architecture Behavioral of Divisor is
	
	--signal aux: integer range 0 to 433; --115200 (433, 217)
	--signal aux: integer range 0 to 2603; --19200 (2603, 1302)
	signal aux: integer range 0 to 5207; --9600 (5207, 2604)
	
begin
	
	process (clk)
	begin
		if rising_edge (clk) then
			if (aux = 5207) then
				aux <= 0;
			elsif (aux < 2604 or aux > 2604) then 
				newC <= '0';
				aux <= aux + 1;
			elsif (aux = 2604) then 
				newC <= '1';
				aux <= aux + 1;
			end if;
		end if;
	end process;

end Behavioral;
