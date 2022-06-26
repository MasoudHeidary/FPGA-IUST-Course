LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY ComBus_test IS
END ComBus_test;
 
ARCHITECTURE behavior OF ComBus_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ComBus
    PORT(
         Sel : IN  std_logic_vector(2 downto 0);
         RW : IN  std_logic;
         ALU : INOUT  std_logic_vector(7 downto 0);
         AX : INOUT  std_logic_vector(7 downto 0);
         BX : INOUT  std_logic_vector(7 downto 0);
         CX : INOUT  std_logic_vector(7 downto 0);
         DX : INOUT  std_logic_vector(7 downto 0);
         RAM : INOUT  std_logic_vector(7 downto 0);
         BUS_DATA : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');
   signal RW : std_logic := '0';

	--BiDirs
   signal AX : std_logic_vector(7 downto 0);
   signal BX : std_logic_vector(7 downto 0);
   signal CX : std_logic_vector(7 downto 0);
   signal DX : std_logic_vector(7 downto 0);
   signal RAM : std_logic_vector(7 downto 0);
   signal BUS_DATA : std_logic_vector(7 downto 0);

 	--Outputs
   signal ALU : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ComBus PORT MAP (
          Sel => Sel,
          RW => RW,
          ALU => ALU,
          AX => AX,
          BX => BX,
          CX => CX,
          DX => DX,
          RAM => RAM,
          BUS_DATA => BUS_DATA
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      AX <= "00000000";
      BX <= "00000001";
      CX <= "00000010";
      DX <= "00000011";

      RW <= '1';

      Sel <= "001";
      wait for 10 ns;

      Sel <= "010";
      wait for 10 ns;

      Sel <= "011";
      wait for 10 ns;

      Sel <= "100";
      wait for 10 ns;

      wait;
   end process;

END;
