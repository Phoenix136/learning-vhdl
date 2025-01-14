--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: I2C_LITEON_Op_Sens_test_tb.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::144 TQ>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library modelsim_lib;
use modelsim_lib.util.all;

entity I2C_LITEON_Op_Sens_test_tb is
end I2C_LITEON_Op_Sens_test_tb;

architecture behavioral of I2C_LITEON_Op_Sens_test_tb is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    constant INSTR_SEQ_SIZE_CONST : natural := 25;
    constant FILT_LENGTH_CONST : natural := 3;

    signal PCLK : std_logic := '0';

    -- i2c port signals
    signal Board_Buttons : std_logic_vector(1 downto 0) := (others => '0');
    signal Board_J11 : std_logic := '0';
    signal Board_J10 : std_logic := '0';
    signal Board_J9 : std_logic := '0';
    signal Board_J8 : std_logic := '0';
    signal Board_LEDs : std_logic_vector(7 downto 0) := (others => '1');
    signal Light_SDA : std_logic := '0';
    signal Light_SCL : std_logic := '0';
    -- i2c port signals

    -- i2c APB spies
    signal ia_PADDR_spy : std_logic_vector(7 downto 0) := (others => '0');
    signal ia_PSEL_spy : std_logic;
    signal ia_PENABLE_spy : std_logic;
    signal ia_PWRITE_spy : std_logic;
    signal ia_PWDATA_spy : std_logic_vector(7 downto 0) := (others => '0');
    signal ia_PRDATA_spy : std_logic_vector(7 downto 0) := (others => '0');
    signal ia_PREADY_spy : std_logic;
    signal ia_PSLVERR_spy : std_logic;
    signal ia_INT_spy : std_logic;
    -- i2c APB spies
    -- i2c Instruction RAM spies
    type reg_seq_type is array((INSTR_SEQ_SIZE_CONST * 2) - 1 downto 0) of std_logic_vector(7 downto 0);
    signal ir_i2c_seq_regs_spy : reg_seq_type;
    type seq_states is(idle, next_instr, do_instr, read_i2c);
    signal ir_seq_state_cur_spy : seq_states;
    signal ir_uSRAM_A_ADDR_sig_spy : std_logic_vector(6 downto 0);
    signal ir_uSRAM_A_DOUT_sig_spy : std_logic_vector(7 downto 0);
    signal ir_uSRAM_B_ADDR_sig_spy : std_logic_vector(6 downto 0);
    signal ir_uSRAM_B_DOUT_sig_spy : std_logic_vector(7 downto 0);
    signal ir_uSRAM_C_WEN_sig_spy : std_logic;
    signal ir_uSRAM_C_ADDR_sig_spy : std_logic_vector(6 downto 0);
    signal ir_uSRAM_C_DIN_sig_spy : std_logic_vector(7 downto 0);
    signal ir_seq_selected_spy : std_logic;
    signal ir_mem_instr_sel_spy : std_logic;
    signal ir_mem_delay_cnt_spy : unsigned(1 downto 0);
    signal ir_write_en_spy : std_logic;
    signal ir_mem_op_req_spy : std_logic;
    signal ir_seq_finished_sig_spy : std_logic;
    -- i2c Instruction RAM spies
    -- i2c Core spies
    signal i_status_sig_spy : std_logic_vector(1 downto 0);
    signal i_data_in_spy : std_logic_vector(7 downto 0);
    signal i_i2c_data_read_spy : std_logic_vector(7 downto 0);
    -- i2c Core spies

    -- LED control spies
    signal led_CH0_0_reg_spy : std_logic_vector(7 downto 0);
    signal led_CH0_1_reg_spy : std_logic_vector(7 downto 0);
    signal led_CH1_0_reg_spy : std_logic_vector(7 downto 0);
    signal led_CH1_1_reg_spy : std_logic_vector(7 downto 0);
    -- LED control spies

    component I2C_LITEON_Op_Sens_test_sd
        -- ports
        port( 
            -- Inputs
            DEVRST_N : in std_logic;
            Board_Buttons : in std_logic_vector(1 downto 0);

            -- Outputs
            Board_J11 : out std_logic;
            Board_J10 : out std_logic;
            Board_J9 : out std_logic;
            Board_J8 : out std_logic;
            Board_LEDs : out std_logic_vector(7 downto 0);

            -- Inouts
            Light_SDA : inout std_logic;
            Light_SCL : inout std_logic

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  I2C_LITEON_Op_Sens_test_sd
    I2C_LITEON_Op_Sens_test_sd_0 : I2C_LITEON_Op_Sens_test_sd
        -- port map
        port map( 
            -- Inputs
            DEVRST_N => NSYSRESET,
            Board_Buttons => Board_Buttons,

            -- Outputs
            Board_J11 => Board_J11,
            Board_J10 => Board_J10,
            Board_J9 => Board_J9,
            Board_J8 => Board_J8,
            Board_LEDs => Board_LEDs,

            -- Inouts
            Light_SDA => Light_SDA,
            Light_SCL => Light_SCL

        );

    spy_process : process
    begin
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/FCCC_C0_0/GL0", "PCLK", 1, -1);

        -- i2c APB spies
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PADDR", "ia_PADDR_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PSEL", "ia_PSEL_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PENABLE", "ia_PENABLE_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PWRITE", "ia_PWRITE_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PWDATA", "ia_PWDATA_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PRDATA", "ia_PRDATA_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PREADY", "ia_PREADY_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/PSLVERR", "ia_PSLVERR_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/INT", "ia_INT_spy", 1, -1);
        -- i2c APB spies
        
        -- i2c RAM spies
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/i2c_seq_regs", "ir_i2c_seq_regs_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/seq_state_cur", "ir_seq_state_cur_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/uSRAM_A_ADDR_sig", "ir_uSRAM_A_ADDR_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/uSRAM_A_DOUT_sig", "ir_uSRAM_A_DOUT_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/uSRAM_B_ADDR_sig", "ir_uSRAM_B_ADDR_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/uSRAM_B_DOUT_sig", "ir_uSRAM_B_DOUT_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/uSRAM_C_WEN_sig", "ir_uSRAM_C_WEN_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/uSRAM_C_ADDR_sig", "ir_uSRAM_C_ADDR_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/uSRAM_C_DIN_sig", "ir_uSRAM_C_DIN_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/seq_selected", "ir_seq_selected_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/mem_instr_sel", "ir_mem_instr_sel_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/mem_delay_cnt", "ir_mem_delay_cnt_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/write_en", "ir_write_en_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/mem_op_req", "ir_mem_op_req_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/seq_finished_sig", "ir_seq_finished_sig_spy", 1, -1);
        -- i2c RAM spies

        -- i2c core spies
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/I2C_Core_0/status_sig", "i_status_sig_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/I2C_Core_0/data_in", "i_data_in_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/I2C_Core_APB3_0/I2C_Instruction_RAM_0/I2C_Core_0/i2c_data_read", "i_i2c_data_read_spy", 1, -1);
        -- i2c core spies

        -- led ctrl spies
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/LED_Controller_0/CH0_0_reg", "led_CH0_0_reg_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/LED_Controller_0/CH0_1_reg", "led_CH0_1_reg_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/LED_Controller_0/CH1_0_reg", "led_CH1_0_reg_spy", 1, -1);
        init_signal_spy("I2C_LITEON_Op_Sens_test_sd_0/LED_Controller_0/CH1_1_reg", "led_CH1_1_reg_spy", 1, -1);
        -- led ctrl spies

        wait;
    end process;


    Board_Buttons <= "00";

end behavioral;

