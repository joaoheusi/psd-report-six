LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY alu IS
    PORT (
        i_SEL : IN STD_LOGIC;
        i_DATA_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        i_DATA_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        o_S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END alu;
ARCHITECTURE arch_1 OF alu IS
BEGIN
    PROCESS (i_SEL, i_DATA_A, i_DATA_B)
    BEGIN
        o_S <= i_DATA_A + i_DATA_B;
    END PROCESS;
END ARCHITECTURE arch_1;