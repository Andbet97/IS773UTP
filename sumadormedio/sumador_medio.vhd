----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:48:03 02/19/2017 
-- Design Name: 
-- Module Name:    sumador_medio - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumador_medio is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           s : out  STD_LOGIC);
end sumador_medio;

architecture Behavioral of sumador_medio is

begin

s <= a XOR b;
cout <= a AND b;

end Behavioral;

