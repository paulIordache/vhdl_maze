----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2023 07:52:27 PM
-- Design Name: 
-- Module Name: VGA_PROCEDURE - procedure_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package Square is 
    procedure SQ(signal Xpos, Ypos, Xcur, Ycur : in integer; signal RGB : out std_logic_vector(3 downto 0); signal draw : out std_logic);
end Square;

package body Square is
procedure SQ(signal Xpos, Ypos, Xcur, Ycur : in integer; signal RGB : out std_logic_vector(3 downto 0); signal draw : out std_logic) is
begin
    if(Xcur > Xpos and Xcur < (Xpos + 100) and Ycur > Ypos and Ycur < (Ypos + 100)) then
        RGB <= "1111";
        draw <= '1';
        else
        draw <= '0';
    end if;
end SQ;
end Square;
