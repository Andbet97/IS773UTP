LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Rx_TB IS
END Rx_TB;
 
ARCHITECTURE behavior OF Rx_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rx
    PORT(
         Dato_entrada : IN  std_logic;
         CLK : IN  std_logic;
         Dato_salida : OUT  std_logic_vector(7 downto 0);
         Campana : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Dato_entrada : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Dato_salida : std_logic_vector(7 downto 0);
   signal Campana : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rx PORT MAP (
          Dato_entrada => Dato_entrada,
          CLK => CLK,
          Dato_salida => Dato_salida,
          Campana => Campana
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		Dato_entrada <= '1';
      wait for 10 ns;
		wait for 156240 ns;
		Dato_entrada <= '0';
		wait for 104160 ns;
		Dato_entrada <= '1';
		wait for 104160 ns;
		Dato_entrada <= '0';
		wait for 104160 ns;
		Dato_entrada <= '1';
		wait for 104160 ns;
		Dato_entrada <= '0';
		wait for 104160 ns;
		Dato_entrada <= '1';
		wait for 104160 ns;
		Dato_entrada <= '1';
		wait for 104160 ns;
		Dato_entrada <= '0';
		wait for 104160 ns;
		Dato_entrada <= '0';
		wait for 104160 ns;
		Dato_entrada <= '0';
		wait for 104160 ns;
		Dato_entrada <= '1';
		wait for 104160 ns;
		Dato_entrada <= '1';
      wait;
   end process;

END;
