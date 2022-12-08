LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY register_bank IS
    GENERIC (
        g_ADDRESS_LENGTH : NATURAL := 4; -- tamanho do conjunto de instruções
        g_DATA_LENGTH : NATURAL := 16 -- tamanho em bits de uma instrução
    );
    PORT (
        i_CLK : IN STD_LOGIC;
        i_RF_W_E : IN STD_LOGIC;
        i_RF_R1_E : IN STD_LOGIC;
        i_RF_R2_E : IN STD_LOGIC;
        i_RF_W_ADDRESS : IN STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
        i_RF_R1_ADDRESS : IN STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
        i_RF_R2_ADDRESS : IN STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
        i_RF_W_DATA : IN STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0);
        o_RF_R1_DATA : OUT STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0);
        o_RF_R2_DATA : OUT STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0)
    );
END register_bank;

ARCHITECTURE arch_1 OF register_bank IS

    TYPE t_RFBANK IS ARRAY (0 TO (2 ** (g_ADDRESS_LENGTH) - 1)) OF STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0);

    SIGNAL w_TEMP_RF : t_RFBANK;
BEGIN

    p_WRITE : PROCESS (i_CLK, i_RF_W_E, i_RF_W_ADDRESS, i_RF_W_DATA)
    BEGIN
        --- processo escrita
    END PROCESS p_WRITE;

    p_READ_R1 : PROCESS (i_CLK, i_RF_R1_E, i_RF_R1_ADDRESS)
    BEGIN
        --- processo escrita
    END PROCESS p_READ_R1;

    p_READ_R2 : PROCESS (i_CLK, i_RF_R2_E, i_RF_R2_ADDRESS)
    BEGIN
        --- processo escrita
    END PROCESS p_READ_R2;

END ARCHITECTURE arch_1;