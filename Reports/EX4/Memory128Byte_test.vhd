LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY Memory128Byte_test IS
END Memory128Byte_test;
 
ARCHITECTURE behavior OF Memory128Byte_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory128Byte
    PORT(
         Din : IN  std_logic_vector(7 downto 0);
         Dout : OUT  std_logic_vector(7 downto 0);
         Address : IN  std_logic_vector(6 downto 0);
         RW : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal Address : std_logic_vector(6 downto 0) := (others => '0');
   signal RW : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory128Byte PORT MAP (
          Din => Din,
          Dout => Dout,
          Address => Address,
          RW => RW
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;

      Address <= "0000001";
      RW <= '0';
      wait for 10 ns;

      Din <= "11110000";
      RW <= '1';
      wait for 10 ns;

      Din <= "00000000";
      RW <= '0';
      wait for 10 ns;

      wait;
   end process;

END;
