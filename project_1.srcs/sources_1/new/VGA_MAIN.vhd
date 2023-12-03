library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MAIN is
    Port (
        CLOCK_24 : in std_logic_vector (1 downto 0);
        VGA_HS, VGA_VS : out std_logic;
        VGA_G, VGA_R, VGA_B : out std_logic_vector (3 downto 0);
        up, down, right, left : std_logic
    );
end MAIN;

architecture vga_architecture of MAIN is

--Components declaration
component SQUARE
    generic ( 
        width : integer := 1040;
        height : integer := 666
    ); 
    Port (       
        CLK, clk_gen : in std_logic;
        HSYNC, VSYNC: out std_logic;
        R, G, B : out std_logic_vector (3 downto 0);
        up, down, right, left : std_logic
    );
end component;

component freq_div 
    Port (
        clk : in std_logic;
        clk_gen : out std_logic
    );
end component;       
         
component second_divider
    Port (
        clk : in std_logic;
        clk_gen : out std_logic
    );
end component;

component debouncer 
    Port ( 
        signal btn:in std_logic;
        signal clk:in std_logic;
        signal en:out std_logic
     );
 end component;
 --End of components declaration

--Signal declaration for auxiliary VGA clock
--and movement clock
signal VGA_CLK, clk_gen : std_logic;

begin
    y1 : second_divider port map(
        clk => CLOCK_24(0),
        clk_gen => clk_gen
        );
    C1: freq_div port map(
        clk =>CLOCK_24(0),
        clk_gen => VGA_CLK
        );
    C2 : SQUARE port map (
        CLK => VGA_CLK, 
        clk_gen => clk_gen, 
        HSYNC => VGA_HS, 
        VSYNC => VGA_VS, 
        R => VGA_R, 
        G => VGA_G, 
        B => VGA_B, 
        up => up, 
        down => down, 
        right => right, 
        left => left
        );
end vga_architecture;
