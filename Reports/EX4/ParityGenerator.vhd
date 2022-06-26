library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ParityGenerator is
    Port ( Data : in  STD_LOGIC_VECTOR (7 downto 0);
           En : in  STD_LOGIC;
           P : out  STD_LOGIC);
end ParityGenerator;

architecture Behavioral of ParityGenerator is

begin

process(Data, En)
begin
    if En = '1' then
        P <= Data(0) xor Data(1) xor Data(2) xor Data(3) xor
            Data(4) xor Data(5) xor Data(6) xor Data(7);
    else
        P <= 'Z';
    end if;
end process;

end Behavioral;

