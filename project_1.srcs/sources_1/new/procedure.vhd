library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.create_maze.all;

package my_procedure is   
    procedure draw_maze(signal HPOS, VPOS, index_y, index_x: integer; constant V_BFP, H_BFP : in integer;
    signal maze : vector_animatie; signal draw2 : out std_logic);
    
    procedure draw_maze_another(signal HPOS, VPOS, index_y, index_x: integer; constant V_BFP, H_BFP : in integer;
    signal maze : vector_animatie; signal RGB : out std_logic_vector(3 downto 0); signal draw2 : out std_logic);
    
    procedure draw_square(signal Xcur, Ycur, Xpos, Ypos : in integer; signal RGB : out std_logic_vector (3 downto 0);
    signal DRAW : out std_logic);
    
end my_procedure;

package body my_procedure is

   procedure draw_square(signal Xcur, Ycur, Xpos, Ypos : in integer; signal RGB : out std_logic_vector (3 downto 0);
   signal DRAW : out std_logic) is
        begin   
            
            if (Xcur > Xpos AND Xcur < (Xpos + 20) AND Ycur > Ypos AND Ycur < (Ypos + 20)) then
                DRAW <= '1';
            else
                DRAW <= '0';
            end if;
            --If the current X and Y pixels are between the Square's Area, then draw
            
        end draw_square;
        
   --NOT USED     
   procedure draw_maze(signal HPOS, VPOS, index_y, index_x: integer; constant V_BFP, H_BFP : in integer; 
   signal maze : vector_animatie; signal draw2 : out std_logic) is                                              
       begin
        
            if (VPOS - V_BFP > (index_y - 1) * 20 and VPOS - V_BFP < index_y * 20 + 1) then
                if (HPOS - H_BFP > (index_x - 1) * 20 and HPOS - H_BFP < index_x * 20 + 1) then
                    if maze(index_y)(index_x) = '1' then
                        draw2 <= '1';
                    else
                        draw2 <= '0';
                    end if;
                end if;   
            end if;
            
       end draw_maze;
   --NOT USED
   
   procedure draw_maze_another(signal HPOS, VPOS, index_y, index_x: in integer; constant V_BFP, H_BFP : in integer; signal maze : in vector_animatie; signal RGB : out std_logic_vector(3 downto 0); signal draw2 : out std_logic) is
       begin
        
            if maze (index_y)(index_x) = '1' then   
                RGB <= "1111";
                draw2 <= '1';
            else
                draw2 <= '0';
            end if;
            --Traverse the matrix. If maze(i)(j) is '1', then draw
            
        end draw_maze_another;
    
end my_procedure;