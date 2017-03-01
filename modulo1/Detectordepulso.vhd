----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:17 02/15/2017 
-- Design Name: 
-- Module Name:    Detectordepulso - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Detectordepulso is
    Port ( Button : in  STD_LOGIC; --boton
			  Clk : in  STD_LOGIC; --reloj
           S : out  STD_LOGIC); --respuesta
end Detectordepulso;

architecture Behavioral of Detectordepulso is

signal cont: std_logic_vector (23 downto 0) := (others => '0'); -- variable contador alcanza un maximo de 262143 en 17 bits "11111111111111111"

begin
	process (Clk)
		begin
		if rising_edge(Clk)then --subida de señal de reloj
			S <= '0';
			if ((Button = '1') or (cont > 0 and Button = '0')) then
				if (cont < 10000000) then
					cont <= cont + 1;
				else
					S <=  '1';
					cont <= (others => '0');
				end if;
			end if;
		end if;
	end process;
end Behavioral;

