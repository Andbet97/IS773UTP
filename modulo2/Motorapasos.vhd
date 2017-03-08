----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:00:13 03/01/2017 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity Motor_a_pasos is
	Port ( StepDrive : out std_logic_vector(3 downto 0);
			 Direction : in std_logic;
			 StepEnable : in std_logic;
			 CLK : in std_logic);
end Motor_a_pasos;

--La variable direction como su nombre lo indica es para indicar la dirección a la que va a girar el motor, el StepEnable únicamente es un switch que activa o no el movimiento del motor , el reloj que es esencial para llevar un conteo de pasos y finalmente las salidas de los 4 pines.
--Para esto se requieren las siguientes variables temporales:

architecture Behavioral of Motor_a_pasos is
	
	signal aux : std_logic_vector (3 downto 0) := "0000";
	signal state : std_logic_vector(1 downto 0) := "00";
	signal StepCounter : std_logic_vector(31 downto 0) := (others => '0');
	constant StepLockOut : std_logic_vector(31 downto 0) := "00000000010011000100101101000000";
	
begin

--Estas variables temporales representan:
--State: los posibles estados del motor.
--Contador de pasos: contador que aumenta cada vez que se realiza un paso.
--Steplock: indica la frecuencia a la cual el motor va a dar cada vuelta.
--Finalmente se tiene que hacer el process con el reloj y manipular los estados del motor.
	StepDrive <= aux;
	process(CLK)
		begin
			if ((CLK'event) and (CLK='1')) then
				StepCounter <= StepCounter + 1;

--Esto indica que cada vez que el reloj este en frente de subida se le aumentara en 1 al contador de pasos.

				if (StepCounter >= StepLockOut) then
						StepCounter <= (others => '0');
						aux <= "1111";

--En esta parte solo se "resetea" el contador si es mayor a la frecuencia.

						if (StepEnable = '1') then
							if (Direction = '1') then state <= state + "01"; end if;
							if (Direction = '0') then state <= state - "01"; end if;

--En este apartado se menciona hacia donde va a girar el motor según la variable direction.

							case state is
								when "00" =>aux <= "1000";
								when "01" =>aux <= "0100";
								when "10" =>aux <= "0010";
								when "11" =>aux <= "0001";
								when others => end case;
						end if;
				end if;
			end if;
	end process;
end Behavioral;
