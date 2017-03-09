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
entity Motor_a_pasos is
	Port ( StepDrive : out std_logic_vector(3 downto 0);
			 Direction : in std_logic;
			 StepEnable : in std_logic;
			 CLK : in std_logic);
end Motor_a_pasos;

--Direction: indica la dirección a la que va a girar el motor
--StepEnable: switch que activa o no el movimiento del motor
--CLK: para llevar un conteo de pasos 
--StepDrive: las salidas de los 4 pines.

architecture Behavioral of Motor_a_pasos is
	--Variables temporales:
	signal aux : std_logic_vector (3 downto 0) := "0000";
	signal state : std_logic_vector(1 downto 0) := "00";
	signal StepCounter : std_logic_vector(31 downto 0) := (others => '0');
	constant StepLockOut : std_logic_vector(31 downto 0) := "00000000000001111010000100100000";
	
begin

--State: los posibles estados del motor.
--StepCounter: contador que aumenta cada vez que encuentra un flanco de subida en la señal de reloj.
--StepLockOut: indica la frecuencia a la cual el motor va a dar cada paso.
StepDrive <= aux;
	process(CLK)
		begin
			if ((CLK'event) and (CLK='1')) then		--Esto indica que cada vez que el reloj 
StepCounter <= StepCounter + 1;	-- este en frente de subida se le 
--aumentará en 1 a StepCounter

				if (StepCounter >= StepLockOut) then			--Se resetea el contador
						StepCounter <= (others => '0');		--si es mayor a la frecuencia
						aux <= "1111";

						if (StepEnable = '1') then		--Habilitador activado
							if (Direction = '1') then state <= state + "01"; end if;
							if (Direction = '0') then state <= state - "01"; end if;
			
							case state is		--Determina hacia dónde va a girar
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
