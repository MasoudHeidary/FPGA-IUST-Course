library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory128Byte is
    Port ( Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           Address : in  STD_LOGIC_VECTOR (6 downto 0);
           RW : in  STD_LOGIC);
end Memory128Byte;

architecture Behavioral of Memory128Byte is
    type RAM_128B is array (0 to 127) of STD_LOGIC_VECTOR (7 downto 0);
    signal RAM: RAM_128B := (others => (others => '0'));
begin

process (Din, Address, RW)
begin
    if RW = '0' then
        Dout <= RAM(to_integer(unsigned(Address)));
    
    elsif RW = '1' then 
        RAM(to_integer(unsigned(Address))) <= Din;
    
    end if ;
end process;

end Behavioral;

