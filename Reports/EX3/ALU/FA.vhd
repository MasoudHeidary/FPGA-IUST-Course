library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( A : in        STD_LOGIC;
           B : in        STD_LOGIC;
           Cin : in      STD_LOGIC;
           Sum : out     STD_LOGIC;
           Cout : out    STD_LOGIC);
end FA;

architecture Behavioral of FA is
begin
	Sum <= A xor B xor Cin;
   Cout <= (A and B) or (B and Cin) or (A and Cin);

end Behavioral;

