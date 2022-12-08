LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_numeric.ALL;

ENTITY instruction_rom IS
    GENERIC (
        g_ADDRESS_LENGTH : NATURAL := 4; -- tamanho do conjunto de instruções
        g_DATA_LENGTH : NATURAL := 16 -- tamanho em bits de uma instrução
    );
    PORT (
        i_ADD : IN STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
        o_DATA : OUT STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0)
    );
END instruction_rom;

ARCHITECTURE arch_1 OF instruction_rom IS
    TYPE t_ROM IS ARRAY (0 TO (2 ** (g_ADDRESS_LENGTH) - 1)) OF STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0);

    CONSTANT r_MEM : t_ROM := (
        "0011000000001000",
        "0000000100000001",
        "0010001000000001",
        "0001001000001001"
    );

BEGIN
    PROCESS (i_ADD) IS
    BEGIN
        o_DATA <= r_MEM(to_integer(i_ADD));
    END PROCESS

END ARCHITECTURE arch_1