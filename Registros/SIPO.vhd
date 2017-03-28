library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO is
    Port ( I : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (3 downto 0));
end SIPO;

architecture Behavioral of SIPO is

signal aux : std_logic_vector(3 downto 0) := "0000";

begin

	O <= aux;
		
	process (clk, CLR)
	begin
		if CLR = '1' then
			aux <= "0000";
		elsif (CLK'event and CLK='1') then
			aux(3 downto 1) <= aux(2 downto 0);
			aux(0) <= I;
		end if;
	end process;


end Behavioral;

