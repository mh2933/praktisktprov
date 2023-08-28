----------------------------------------
-- Omtenta 
-- Praktiskt prov VHDL Digitalteknik
-- Mathias Hamlet
-- Ei22 
-- 
-- 2023-08-28
----------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity praktisktprov is
  port ( clk                       : in std_logic;
         rst                       : in std_logic;
         newmsg                    : in std_logic;
         expmsg                    : in std_logic;
         numofmsgs                 : out unsigned(3 downto 0)
         );
         
end entity;

architecture praktisktprov_arch of praktisktprov is
   
   signal numofmsgs_s    : unsigned(3 downto 0) := "0000";
   signal prev_newmsg    : std_logic := '0';
   signal prev_expmsg    : std_logic := '0';
  
   
 begin

  COUNT : process(clk, rst, newmsg, expmsg)
    
    begin
         
         if (rst = '0') then 
            numofmsgs_s <= "0000";
            
         elsif (rising_edge(clk)) then 
         
         if(newmsg = '1' and expmsg = '1') then
            numofmsgs_s  <= numofmsgs_s;
         
         elsif (newmsg ='1' and prev_newmsg = '0') then 
            numofmsgs_s  <= numofmsgs_s  + 1;
            
         elsif(expmsg = '1' and prev_expmsg = '0') then
            numofmsgs_s  <= numofmsgs_s  - 1;
         
         end if;      
        
         prev_newmsg <= newmsg;
         prev_expmsg <= expmsg;
        
         end if;
   
         numofmsgs <= numofmsgs_s; 
           
   end process;
      
end architecture;   