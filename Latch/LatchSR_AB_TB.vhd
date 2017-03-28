LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY LatchSR_AB_TB IS
END LatchSR_AB_TB;
 
ARCHITECTURE behavior OF LatchSR_AB_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LatchSR_AB
    PORT(
         Sn : IN  std_logic;
         Rn : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Sn : std_logic := '0';
   signal Rn : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qn : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LatchSR_AB PORT MAP (
          Sn => Sn,
          Rn => Rn,
          Q => Q,
          Qn => Qn
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- S = '0' y R = '0'
      wait for 100 ns;
		-- S = '0' y R = '1'
		Rn <= '1';
      wait for 100 ns;
		-- S = '1' y R = '0'
		Rn <= '0';
		Sn <= '1';
      wait for 100 ns;
		-- S = '1' y R = '1'
		Rn <= '1';

      wait;
   end process;

END;
