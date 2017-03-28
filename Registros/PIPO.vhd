library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PIPO is
    Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC);
end PIPO;

architecture Behavioral of PIPO is

signal aux : std_logic_vector(3 downto 0) := "0000";

begin

	Q <= aux;
	
	process (CLK)
	
	begin
		
		if CLK'event and CLK='1' then  
			aux <= D;
		end if;
	end process;

end Behavioral;

