library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD8 is
    Port ( A : in        STD_LOGIC_VECTOR (7 downto 0);
           B : in        STD_LOGIC_VECTOR (7 downto 0);
           Cin : in      STD_LOGIC;
           Sum : out     STD_LOGIC_VECTOR (7 downto 0);
           Cout : out    STD_LOGIC);
end ADD8;

architecture Behavioral of ADD8 is
    signal c: STD_LOGIC_VECTOR (6 downto 0);

    COMPONENT FA
	PORT(
		A : IN      std_logic;
		B : IN      std_logic;
		Cin : IN    std_logic;          
		Sum : OUT   std_logic;
		Cout : OUT  std_logic
		);
	END COMPONENT;
begin

-- FA 0
Inst_FA0: FA PORT MAP (
        A => A(0),
        B => B(0),
        Cin => Cin,
        Sum => Sum(0),
        Cout => c(0)
    );

-- FA from 1 to 6
gen : for i in 1 to 6 generate
    Inst_FA: FA PORT MAP (
        A => A(i),
        B => B(i),
        Cin => c(i-1),
        Sum => Sum(i),
        Cout => c(i)
    );
end generate ; -- gen

-- FA 7
Inst_FA7: FA PORT MAP (
        A => A(7),
        B => B(7),
        Cin => c(6),
        Sum => Sum(7),
        Cout => Cout
    );

end Behavioral;

