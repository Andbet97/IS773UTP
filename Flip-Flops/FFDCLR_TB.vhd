LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FFDCLR_TB IS
END FFDCLR_TB;
 
ARCHITECTURE behavior OF FFDCLR_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FFDCLR
    PORT(
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         D : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal D : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FFDCLR PORT MAP (
          CLK => CLK,
          CLR => CLR,
          D => D,
          Q => Q
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
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		D <= '1';
		wait for 10 ns;
		CLR <= '1';
		wait for 40 ns;
		CLR <= '0';
      wait;
   end process;

END;
