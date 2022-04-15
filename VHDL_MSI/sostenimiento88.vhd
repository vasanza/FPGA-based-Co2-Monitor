library ieee;
use ieee.std_logic_1164.all;

entity sostenimiento88 is
port (clock, reset, En: in std_logic;
		Ent: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0));
end sostenimiento88;

architecture desarrollo of sostenimiento88 is
signal temp: std_logic_vector(7 downto 0);
begin
process(clock)
	begin
	if reset='1' then temp<="00000000";
	elsif (clock'event and clock='1') then
		if En='1' then temp<=Ent;
			else temp<=temp;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;