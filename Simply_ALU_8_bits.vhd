library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_BIT.all;

entity Simply_ALU_8_bits is
port( A:in UNSIGNED(3 downto 0);
	  B:in UNSIGNED(3 downto 0);
	  S:in std_logic_vector(1 downto 0);
	  Y:out UNSIGNED(7 downto 0) );
end Simply_ALU_8_bits;

architecture ALU_dataflow of Simply_ALU_8_bits is
signal extend_A:UNSIGNED(7 downto 0);
signal extend_B:UNSIGNED(7 downto 0);
begin
	extend_A <= "0000"&A;
	extend_B <= "0000"&B;
	with S select
		Y <= extend_A AND extend_B when "00",
			 A * B when "01",
			 extend_A + extend_B when "10",
			 extend_A / extend_B when "11";
end ALU_dataflow;



