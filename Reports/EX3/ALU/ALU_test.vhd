LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         F : OUT  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         OPCODE : IN  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal OPCODE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal F : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          F => F,
          Cin => Cin,
          OPCODE => OPCODE,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      A <= "11000000";
      B <= "00000011";
      Cin <= '1';

      OPCODE <= "0000";
      wait for 10 ns;

      OPCODE <= "0001";
      wait for 10 ns;

      OPCODE <= "1010";
      wait for 10 ns;

      wait;
   end process;

END;
