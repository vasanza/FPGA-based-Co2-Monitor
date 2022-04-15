library ieee;
use ieee.std_logic_1164.all;

entity sostenimiento is
port (clock, reset, En: in std_logic;
		Ent: in std_logic;
		Q: out std_logic);
end sostenimiento;

architecture desarrollo of sostenimiento is
signal temp: std_logic;
begin
process(clock)
	begin
	if reset='1' then temp<='0';
	elsif (clock'event and clock='1') then
		if En='1' then temp<=Ent;
			else temp<=temp;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;