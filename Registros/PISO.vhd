library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO is
    Port ( SL : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC);
end PISO;

architecture Behavioral of PISO is

signal aux : std_logic := '0';

begin
	
	S <= aux;
	
	process (clk , SL, A) is
   variable temp : std_logic_vector (3 downto 0);
   begin
       if (SL='1') then
           temp := A ;
       elsif (rising_edge (clk)) then
           aux <= temp(0);
           temp := '0' & temp(3 downto 1);
       end if;
   end process;

end Behavioral;

