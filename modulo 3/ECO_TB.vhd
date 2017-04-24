LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ECO_TB IS
END ECO_TB;
 
ARCHITECTURE behavior OF ECO_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ECO
    PORT(
         Rx : IN  std_logic;
         Tx : OUT  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rx : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Tx : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ECO PORT MAP (
          Rx => Rx,
          Tx => Tx,
          CLK => CLK
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
      Rx <= '1';
      wait for 10 ns;
		wait for 156240 ns;
		Rx <= '0';
		wait for 104160 ns;
		Rx <= '1';
		wait for 104160 ns;
		Rx <= '0';
		wait for 104160 ns;
		Rx <= '1';
		wait for 104160 ns;
		Rx <= '0';
		wait for 104160 ns;
		Rx <= '1';
		wait for 104160 ns;
		Rx <= '1';
		wait for 104160 ns;
		Rx <= '0';
		wait for 104160 ns;
		Rx <= '0';
		wait for 104160 ns;
		Rx <= '0';
		wait for 104160 ns;
		Rx <= '1';
		wait for 104160 ns;
		Rx <= '1';
      wait;
   end process;

END;
