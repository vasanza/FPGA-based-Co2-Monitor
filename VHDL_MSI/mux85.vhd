library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Mux85 is
	generic ( n: integer:=16);--<-- nbits
	port (
		A : in std_logic_vector(n-1 downto 0);
		B : in std_logic_vector(n-1 downto 0);
		C : in std_logic_vector(n-1 downto 0);
		D : in std_logic_vector(n-1 downto 0);
		sel : in std_logic_vector(1 downto 0);
		
		Q : out std_logic_vector(n-1 downto 0));
end Mux85;

--Architecture
architecture solve of Mux85 is
	-- Signals,Constants,Variables,Components
	signal f: std_logic_vector(n-1 downto 0);
	begin
		with sel select 
		f<= A when "00",
			 B when "01",
			 C when "10",
			 D when others;
		Q<= f;	 
end solve;