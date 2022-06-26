LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY ParityGenerator_test IS
END ParityGenerator_test;
 
ARCHITECTURE behavior OF ParityGenerator_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ParityGenerator
    PORT(
         Data : IN  std_logic_vector(7 downto 0);
         En : IN  std_logic;
         P : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data : std_logic_vector(7 downto 0) := (others => '0');
   signal En : std_logic := '0';

 	--Outputs
   signal P : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ParityGenerator PORT MAP (
          Data => Data,
          En => En,
          P => P
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      
      Data <= "00000000";
      En <= '0';
      wait for 10 ns;

      En <= '1';
      wait for 10 ns;

      Data <= "00000001";
      wait for 10 ns;

      wait;
   end process;

END;
