LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY adder IS
  PORT (
    i_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    i_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    o_C : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END adder;
ARCHITECTURE arch_1 OF adder IS
BEGIN

  o_C <= i_A + i_B;

END ARCHITECTURE arch_1