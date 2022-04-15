--Library
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

--Entity
entity RAMmif is 
	port(
		clk,wr: in std_logic; 
		addr : in std_logic_vector(7 downto 0); 
		Din : in std_logic_vector(19 downto 0);
		Dout : out std_logic_vector(19 downto 0));
		
end RAMmif;

--Architecture
architecture solve of RAMmif is
	-- Signals,Constants,Variables,Components	
	type ram_type is array (0 to 255) of bit_vector(19 downto 0); 
	signal ram: ram_type;
	attribute ram_init_file:string;
	attribute ram_init_file of ram: signal is "memo_cont.mif";
	
	 
	begin
	--Process #1:
	process(clk,wr)
	--Sequential programming
		begin 
			if (clk'event and clk='1') then 
					
				if	(wr='1') then
					ram(conv_integer(addr)) <= to_bitvector(Din); end if;
					
				
			end if; 
	end process; 
	Dout <= to_stdlogicvector(ram(conv_integer(addr)));--read
	
	--Process #n...
end solve;