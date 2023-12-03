library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use work.my_procedure.all;
use work.create_maze.all;
use IEEE.math_real.all;


entity SQUARE is
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
end SQUARE;


architecture sync_arch of SQUARE is

--Position of the pixel horizontally and vertically
signal HPOS: integer range 0 to width := 0;
signal VPOS: integer range 0 to height := 0;

--Position of the square
signal SQ_X : integer range 0 to width := 250;
signal SQ_Y : integer range 0 to height := 116;

signal RGB : std_logic_vector (3 downto 0);

--Signals for drawing procedures
signal DRAW, draw2 : std_logic;

--Indexes for the matrix
signal index_x, index_y : integer := 1;

--Constant values for Backporch + Sync + Frontporch
constant H_BFP : integer := 240; --horizontal constant
constant V_BFP : integer := 66; --vertical constant

signal maze : vector_animatie := maze_const;
signal which : integer range 0 to 1 := 0;
begin

--Procedures for drawing the square/maze
--View procedure.vhd and procedure_create_maze.vhd 
draw_maze_another(HPOS, VPOS, index_y, index_x, V_BFP, H_BFP, maze, RGB, draw2); 
draw_square(HPOS, VPOS, SQ_X, SQ_Y, RGB, DRAW);

drawing : process(clk, clk_gen) --clk_gen -> divided clock for movement
    begin
        
    if clk'event and clk = '1' then  
        
        if draw2 = '1' or draw = '1' then
            R <= "1111";
            G <= "1111";
            B <= "1111";
        else
            R <= (others => '0');
            G <= (others => '0');
            B <= (others => '0');  
        end if;
              
    end if;
    
    --draw_maze   
--    if HPOS - H_BFP > index_x * 20 then
--        index_x <= index_x + 1;
--    end if;
    
--    if VPOS - V_BFP > index_y * 20 then
--        index_y <= index_y + 1;
--    end if;
      --draw_maze 
    
    
    if(clk'event and clk = '1') then
    
        if HPOS - H_BFP > 0 and HPOS - H_BFP < 800 then
            index_x <= HPOS - H_BFP;
            --HPOS is between 0 and 1040
            --Visible area is between 240 and 1040 horizontally (1/2)
            --and between 66 and 666 vertically (2/2)
            --Desired to visualize easily when should index_x take the value of (1/2)
            --the visible area's horizontal pixel (2/2)
        else
            index_x <= 1;
            index_y <= VPOS - V_BFP;
            --Reset index_x and assign index_y the visible area's vertical pixel
        end if;
                        
        if HPOS < 1040 then
            HPOS <= HPOS + 1;
            --Increment horizontal pixel position
        else
            HPOS <= 0;
            if VPOS < 666 then
                VPOS <= VPOS + 1;
                --Increment vertical pixel position
            else
                VPOS <= 0;
                index_y <= 1;
                --Reset index_y 
            end if;
        end if;
                       
        if(HPOS > 56 and HPOS < 176) then
            HSYNC <= '0';
        else
            HSYNC <= '1';
        end if;
        
        if(VPOS > 37 and VPOS < 43)then
            VSYNC <= '0';
        else
            VSYNC <= '1';
        end if;
        --During the SYNC PULSE moment, VSYNC and HSYNC are '0'
        
        
        if((HPOS > 0 and HPOS < 240) or (VPOS > 0 and VPOS < 66)) then
            R <= (others => '0');
            B <= (others => '0');
            G <= (others => '0');
        end if;
        --Black colour during Frontporch + Backporch + Sync pulse
    
    end if;
    
    if rising_edge(clk_gen) then    
        
        if right = '1' then
            change(maze);
            SQ_X <= SQ_X + 5;
        end if;
        
        if left = '1' then
            change(maze);
            SQ_X <= SQ_X - 5;
        end if;
        
        if up = '1' then
            change(maze);
            SQ_Y <= SQ_Y - 5;
        end if;
        
        if down = '1' then
            change(maze);    
            SQ_Y <= SQ_Y + 5;
        end if;
    
    end if;

end process;
         
end sync_arch;
