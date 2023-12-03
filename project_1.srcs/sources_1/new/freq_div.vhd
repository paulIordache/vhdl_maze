library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity freq_div is
    Port (
        clk : in std_logic;
        clk_gen : out std_logic
    );
end freq_div;

architecture freq_div_arch of freq_div is

signal clk_aux : std_logic := '0';

begin

--Divide the clock to 50Mhz
process(clk)
    begin   
        
        if rising_edge(clk) then
                clk_aux <= not(clk_aux);
        end if;   
         
end process;
 
clk_gen  <= clk_aux;               

end freq_div_arch;
