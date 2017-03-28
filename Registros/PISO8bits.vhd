library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO8bits is
    Port ( Reset : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           SL : in  STD_LOGIC;
           O : out  STD_LOGIC);
end PISO8bits;

architecture Behavioral of PISO8bits is

signal aux : std_logic := '0';

begin
	
	O <= aux;
	
	process (clk , SL, D, Reset) is
	
   variable temp : std_logic_vector (7 downto 0);
	
   begin
		
		if (Reset = '1') then
			temp := "00000000";
			aux <= '0';
      elsif (SL='1') then
          temp := D;
      elsif (rising_edge (clk)) then
          aux <= temp(0);
          temp := '0' & temp(7 downto 1);
      end if;
   end process;

end Behavioral;

