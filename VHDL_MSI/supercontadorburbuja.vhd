library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity supercontadorburbuja is

port (clock, reset, Ld,Ldj,En: in std_logic;
		Ent: in std_logic_vector(7 downto 0);
		
		Q: out std_logic_vector(7 downto 0);
		Qj: out std_logic_vector(7 downto 0));
end supercontadorburbuja;

architecture desarrollo2 of supercontadorburbuja is
signal temp: std_logic_vector(7 downto 0);
signal tempj: std_logic_vector(7 downto 0);
begin
process(clock ,reset)
	begin
	if reset='1' then temp<="00000000";
	elsif (clock'event and clock='1') then
		if (Ld='1' and En='1') then temp<=Ent;
			elsif En='1' then
				if temp="11111111" then temp<="00000000";
				else temp<=temp+1;
				end if;
		end if;
	end  if;
tempj<=temp+1;	
	
	
	
end process;

Q<=temp;
Qj<=tempj;
end desarrollo2;