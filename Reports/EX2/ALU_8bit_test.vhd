LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_8bit_test IS
END ALU_8bit_test;
 
ARCHITECTURE behavior OF ALU_8bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_8bit
    PORT(
         DR1 : IN  std_logic_vector(7 downto 0);
         DR2 : IN  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         OPCODE : IN  std_logic_vector(3 downto 0);
         AC : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal DR1 : std_logic_vector(7 downto 0) := (others => '0');
   signal DR2 : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal OPCODE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal AC : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_8bit PORT MAP (
          DR1 => DR1,
          DR2 => DR2,
          Cin => Cin,
          OPCODE => OPCODE,
          AC => AC,
          Cout => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		DR1 <= "11110000";
		DR2 <= "00111100";

      OPCODE <= "0000";
		wait for 20ns;
      
      OPCODE <= "0100";
      wait for 20ns;

      OPCODE <= "0101";
      wait for 20ns;

      OPCODE <= "0110";
      wait for 20ns;
		
		OPCODE <= "0111";
      wait for 20ns;

		wait;
   end process;

END;
