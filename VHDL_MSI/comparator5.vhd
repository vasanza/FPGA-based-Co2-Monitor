library ieee;
use ieee.std_logic_1164.all;

--Entity
Entity Comparator5 is
	generic ( n: integer :=5);--<-- nbits
	Port(
		A: in std_logic_vector(n-1 downto 0);
		B: in std_logic_vector(n-1 downto 0);
		AmenorB, AmayorB, AigualB: out std_logic);
end Comparator5;

--Architecture
Architecture solve of Comparator5 is
	-- Signals,Constants,Variables,Components
	Begin
		AmenorB<='1' when A<B else '0';
		AmayorB<='1' when A>B else '0';
		AigualB<='1' when A=B else '0';
end solve;
