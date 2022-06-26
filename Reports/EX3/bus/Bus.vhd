library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ComBus is
    Port ( Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           RW : in  STD_LOGIC;
           ALU: inout STD_LOGIC_VECTOR (7 downto 0);
           AX : inout  STD_LOGIC_VECTOR (7 downto 0);
           BX : inout  STD_LOGIC_VECTOR (7 downto 0);
           CX : inout  STD_LOGIC_VECTOR (7 downto 0);
           DX : inout  STD_LOGIC_VECTOR (7 downto 0);
           RAM : inout  STD_LOGIC_VECTOR (7 downto 0);
           BUS_DATA : inout  STD_LOGIC_VECTOR (7 downto 0));
end ComBus;

architecture Behavioral of ComBus is
signal R: STD_LOGIC_VECTOR (7 downto 0);
signal W: STD_LOGIC_VECTOR (7 downto 0) := "00000010";
begin

    with Sel select
        R <=    ALU when "000",
                AX  when "001",
                BX  when "010",
                CX  when "011",
                DX  when "100",
                RAM when "101",
                "ZZZZZZZZ" when others;
        
    with RW select
        BUS_DATA <= R when '1',
                    "ZZZZZZZZ" when others;

    with RW select
        W <=    BUS_DATA when '0',
                "ZZZZZZZZ" when others;

    ALU <=  W when (Sel = "000") else "ZZZZZZZZ";
    AX  <=  W when (Sel = "001") else "ZZZZZZZZ";
    BX  <=  W when (Sel = "010") else "ZZZZZZZZ";
    CX  <=  W when (Sel = "011") else "ZZZZZZZZ";
    DX  <=  W when (Sel = "100") else "ZZZZZZZZ";
    RAM <=  W when (Sel = "101") else "ZZZZZZZZ";

end Behavioral;
