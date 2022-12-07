LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux3_1x16bit IS
  PORT (
    i_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- selector
    i_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- data input
    i_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- data input
    i_C : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- data input
    o_S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)); -- data output
END mux3_1x16bit;

ARCHITECTURE arch_1 OF mux3_1x16bit IS
BEGIN
  PROCESS (i_SEL, i_A, i_B, i_C)
  BEGIN
    IF (i_SEL = "00") THEN
      o_S <= i_A;
    ELSIF (i_SEL = "01") THEN
      o_S <= i_B;
    ELSIF (i_SEL = "10") THEN
      o_S <= i_C;
    ELSE
      o_S <= "0000000000000000";
    END IF;
  END PROCESS;
END arch_1;