library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;
 
--Entity
entity decopivot is
   port(
		sel: in std_logic_vector(3 downto 0);
		p1: out std_logic_vector(7 downto 0);
		p2: out std_logic_vector(7 downto 0);
		p3: out std_logic_vector(7 downto 0));
end decopivot;

--Architecture
architecture solve of decopivot is
	-- Signals,Constants,Variables,Components
	 begin

		with sel select 
		p1<="00000101"  when "1010",
			 "00001010" when "0100",
			 "00001110" when "1100",
			 "00001000" when "0011",
			
			 "00000000" when others;
		with sel select 
		
		p2<="00000010" when "1010",
			 "00000101" when "0100",
			 "00001001" when "1100",
			 "00001000" when "0011",
			
			 "00000000" when others;
		with sel select 
			 
		p3<="00000111" when "1010",
			 "00001111" when "0100",
			 "00000100" when "1100",
			 "00011011" when "0011",
			
			 "00000000" when others;
		
end solve;