LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Tx_TB IS
END Tx_TB;
 
ARCHITECTURE behavior OF Tx_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Tx
    PORT(
         Campana : IN  std_logic;
         CLK : IN  std_logic;
         Dato_entrada : IN  std_logic_vector(7 downto 0);
         Dato_salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Campana : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Dato_entrada : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Dato_salida : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Tx PORT MAP (
          Campana => Campana,
          CLK => CLK,
          Dato_entrada => Dato_entrada,
          Dato_salida => Dato_salida
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
      wait for 10 ns;
		wait for 156240 ns;
		Campana <= '1';
		Dato_entrada <= "10101100";
		wait for 104160 ns;
		Campana <= '0';
		Dato_entrada <= "00000000";
      wait;
   end process;

END;
