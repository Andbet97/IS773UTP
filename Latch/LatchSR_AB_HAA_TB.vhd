LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY LatchSR_AB_HAA_TB IS
END LatchSR_AB_HAA_TB;
 
ARCHITECTURE behavior OF LatchSR_AB_HAA_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LatchSR_AB_HAA
    PORT(
         Sn : IN  std_logic;
         Rn : IN  std_logic;
         EN : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Sn : std_logic := '0';
   signal Rn : std_logic := '0';
   signal EN : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qn : std_logic;
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LatchSR_AB_HAA PORT MAP (
          Sn => Sn,
          Rn => Rn,
          EN => EN,
          Q => Q,
          Qn => Qn
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- EN = '1', S = '0' y R = '0';
		EN <= '1';
      wait for 100 ns;
		-- EN = '1', S = '0' y R = '1';
		Rn <= '1';
      wait for 100 ns;
		-- EN = '1', S = '1' y R = '0';
		Sn <= '1';
		Rn <= '0';
      wait for 100 ns;
		-- EN = '1', S = '1' y R = '1';
		Rn <= '1';
      wait for 100 ns;
		-- EN = '0', S = 'x' y R = 'x';
		EN <= '0';
      wait;
   end process;

END;
