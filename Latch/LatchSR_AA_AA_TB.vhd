LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LatchSR_AA_AA_TB IS
END LatchSR_AA_AA_TB;
 
ARCHITECTURE behavior OF LatchSR_AA_AA_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LatchSR_AA_AA
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         EN : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';
   signal EN : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qn : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LatchSR_AA_AA PORT MAP (
          S => S,
          R => R,
          EN => EN,
          Q => Q,
          Qn => Qn
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- EN = '1', S = '1' , R = '1'.
		EN <= '1';
		S <= '1';
		R <= '1';
      wait for 100 ns;	
		-- EN = '1', S = '1' , R = '0';
		R <= '0';
      wait for 100 ns;	
		-- EN = '1', S = '0' , R = '1';
		S <= '0';
		R <= '1';
      wait for 100 ns;	
		-- EN = '1', S = '0' , R = '0'.
		R <= '0';
      wait for 100 ns;
		-- EN = '0', S = 'x' , R = 'x'.
		EN <= '0';			
      wait;
   end process;

END;
