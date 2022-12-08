LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY datapath IS
    GENERIC (
        g_ADDRESS_LENGTH : NATURAL := 4; -- tamanho do conjunto de instruções
        g_DATA_LENGTH : NATURAL := 16; -- tamanho em bits de uma instrução
        g_CONSTANT_LENGTH : NATURAL := 8
    );
    PORT (
        i_CLK : IN STD_LOGIC;
        i_MUX_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        i_DATA_BANK : IN STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0);
        i_CONSTANT_DATA : IN STD_LOGIC_VECTOR((g_CONSTANT_LENGTH - 1) DOWNTO 0);
        i_RF_W_E : IN STD_LOGIC;
        i_RF_W_ADDRESS : IN STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
        i_RF_R1_E : IN STD_LOGIC;
        i_RF_R1_ADDRESS : IN STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
        i_RF_R2_E : IN STD_LOGIC;
        i_RF_R2_ADDRESS : IN STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
        i_ALU_SEL : IN STD_LOGIC;
        o_W_DATA_BANK : OUT STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0)
    );
END datapath;

ARCHITECTURE arch_1 OF datapath IS

    COMPONENT register_bank IS
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
    END COMPONENT;

    COMPONENT alu IS
        PORT (
            i_SEL : IN STD_LOGIC;
            i_DATA_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            i_DATA_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o_S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT MUX_3X1 IS
        PORT (
            i_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- selector
            i_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- data input
            i_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- data input
            i_C : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- data input
            o_S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- data output
        );
    END COMPONENT;

    SIGNAL w_CLK, w_RF_W_E, w_RF_R1_E, w_RF_R2_E, w_ALU_SEL : STD_LOGIC;
    SIGNAL w_MUX_SEL : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL w_RF_W_ADDRESS, w_RF_R1_ADDRESS, w_RF_R2_ADDRESS : STD_LOGIC_VECTOR((g_DATA_LENGTH - 1) DOWNTO 0);
    SIGNAL w_o_MUX, w_o_ALU, w_o_RF_R1, w_o_RF_R2, w_o_DATA_BANK : STD_LOGIC_VECTOR((g_ADDRESS_LENGTH - 1)DOWNTO 0);
    SIGNAL w_CONSTANT_DATA : STD_LOGIC_VECTOR((g_CONSTANT_LENGTH - 1) DOWNTO 0);

BEGIN

    MUX_DUT : mux_3x1 PORT MAP(
        i_SEL => w_MUX_SEL,
        i_A => w_o_DATA_BANK,
        i_B => w_o_ALU,
        i_C => w_CONSTANT_DATA,
        o_S => w_o_MUX
    );

    ALU_DUT : alu PORT MAP(
        i_SEL => w_ALU_SEL,
        i_DATA_A => w_o_RF_R1,
        i_DATA_B => w_o_RF_R2,
        o_S => w_o_ALU
    );

    REGISTER_BANK : register_bank PORT MAP(
        i_CLK => w_CLK,
        i_RF_W_E => w_RF_W_E,
        i_RF_R1_E => w_RF_R1_E,
        i_RF_R2_E => w_RF_R2_E,
        i_RF_W_ADDRESS => w_RF_W_ADDRESS,
        i_RF_R1_ADDRESS => w_RF_R1_ADDRESS,
        i_RF_R2_ADDRESS => w_RF_R2_ADDRESS,
        i_RF_W_DATA => w_o_MUX,
        o_RF_R1_DATA => w_o_RF_R1,
        o_RF_R2_DATA => w_o_RF_R2
    );

END ARCHITECTURE arch_1;