library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity second_divider is
    Port (
        clk : in std_logic;
        clk_gen : out std_logic
    );
end second_divider;

architecture Behavioral of second_divider is

signal clock : std_logic := '0';
signal count : integer := 0;

begin

process(clk) 
    begin
        
        if rising_edge(clk) then
             
            if count < 5_000_000 then
                count <= count + 1;
            else
                clock <= not(clock);
                count <= 0;
            end if;
        end if;
end process;

clk_gen <= clock;

end Behavioral;
