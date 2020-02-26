----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sat Feb 22 19:54:47 2020
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: FFT_Butterfly_HW_MATHDSP_tb.vhd
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
use ieee.math_real.uniform;
use ieee.math_real.floor;

use work.FFT_package.all;

library modelsim_lib;
use modelsim_lib.util.all;

entity FFT_Butterfly_HW_MATHDSP_tb is
end FFT_Butterfly_HW_MATHDSP_tb;

architecture behavioral of FFT_Butterfly_HW_MATHDSP_tb is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    -- component signals
    signal do_calc : std_logic;
    signal twiddle_cos_real : std_logic_vector(8 downto 0);
    signal twiddle_sin_imag : std_logic_vector(8 downto 0);
    signal twiddle_sin_imag_1comp : std_logic_vector(8 downto 0);
    signal real_a_in : std_logic_vector(8 downto 0);
    signal imag_a_in : std_logic_vector(8 downto 0);
    signal real_b_in : std_logic_vector(8 downto 0);
    signal imag_b_in : std_logic_vector(8 downto 0);
    signal calc_done : std_logic;
    signal A_done : std_logic;
    signal B_done : std_logic;
    signal real_a_out : std_logic_vector(8 downto 0);
    signal imag_a_out : std_logic_vector(8 downto 0);
    signal real_b_out : std_logic_vector(8 downto 0);
    signal imag_b_out : std_logic_vector(8 downto 0);
    -- component signals

    component FFT_Butterfly_HW_MATHDSP
        -- ports
        port( 
            -- Inputs
            PCLK : in std_logic;
            RSTn : in std_logic;
            do_calc : in std_logic;
            twiddle_cos_real : in std_logic_vector(8 downto 0);
            twiddle_sin_imag : in std_logic_vector(8 downto 0);
            twiddle_sin_imag_1comp : in std_logic_vector(8 downto 0);
            real_a_in : in std_logic_vector(8 downto 0);
            imag_a_in : in std_logic_vector(8 downto 0);
            real_b_in : in std_logic_vector(8 downto 0);
            imag_b_in : in std_logic_vector(8 downto 0);

            -- Outputs
            calc_done : out std_logic;
            A_done : out std_logic;
            B_done : out std_logic;
            real_a_out : out std_logic_vector(8 downto 0);
            imag_a_out : out std_logic_vector(8 downto 0);
            real_b_out : out std_logic_vector(8 downto 0);
            imag_b_out : out std_logic_vector(8 downto 0)

            -- Inouts

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

    -- Instantiate Unit Under Test:  FFT_Butterfly_HW_MATHDSP
    FFT_Butterfly_HW_MATHDSP_0 : FFT_Butterfly_HW_MATHDSP
        -- port map
        port map( 
            -- Inputs
            PCLK => SYSCLK,
            RSTn => NSYSRESET,
            do_calc => do_calc,
            twiddle_cos_real => twiddle_cos_real,
            twiddle_sin_imag => twiddle_sin_imag,
            twiddle_sin_imag_1comp => twiddle_sin_imag_1comp,
            real_a_in => real_a_in,
            imag_a_in => imag_a_in,
            real_b_in => real_b_in,
            imag_b_in => imag_b_in,

            -- Outputs
            calc_done =>  calc_done,
            A_done =>  A_done,
            B_done =>  B_done,
            real_a_out => real_a_out,
            imag_a_out => imag_a_out,
            real_b_out => real_b_out,
            imag_b_out => imag_b_out

            -- Inouts

        );

    spy_process : process
    begin
        --init_signal_spy("FFT_Sample_Loader_0/load_state", "load_state_spy", 1, -1);
        --init_signal_spy("FFT_Sample_Loader_0/load_state_next", "load_state_next_spy", 1, -1);
        --init_signal_spy("FFT_Sample_Loader_0/input_w_en_sig", "input_w_en_sig_spy", 1, -1);
        --init_signal_spy("FFT_Sample_Loader_0/input_w_en_last", "input_w_en_last_spy", 1, -1);
        --init_signal_spy("FFT_Sample_Loader_0/input_w_dat_sig", "input_w_dat_sig_spy", 1, -1);
        --init_signal_spy("FFT_Sample_Loader_0/input_w_ready_sig", "input_w_ready_sig_spy", 1, -1);
        wait;
    end process;


    twiddle_sin_imag_1comp <= not twiddle_sin_imag;

    process
        variable twiddle_cos_real_var : integer;
        variable twiddle_sin_imag_var : integer;
        variable real_a_in_var : integer;
        variable imag_a_in_var : integer;
        variable real_b_in_var : integer;
        variable imag_b_in_var : integer;
        variable temp_real_var : integer;
        variable temp_imag_var : integer;
        variable temp2_real_var : integer;
        variable temp2_imag_var : integer;
        variable real_a_out_var : integer;
        variable imag_a_out_var : integer;
        variable real_b_out_var : integer;
        variable imag_b_out_var : integer;

        variable seed1 : positive;
        variable seed2 : positive;
        variable x1 : real;
    begin
        do_calc <= '0';
        twiddle_cos_real <= (others => '0');
        twiddle_sin_imag <= (others => '0');
        real_a_in <= (others => '0');
        imag_a_in <= (others => '0');
        real_b_in <= (others => '0');
        imag_b_in <= (others => '0');

        wait until (NSYSRESET = '1');
        wait for (SYSCLK_PERIOD * 1);

        seed1 := 1;
        seed2 := 1;
        for i in 0 to 20 loop
            case i is
                when 0 =>
                    -- zeroes
                    twiddle_cos_real <= std_logic_vector(to_signed(0, twiddle_cos_real'length));
                    twiddle_sin_imag <= std_logic_vector(to_signed(0, twiddle_sin_imag'length));
                    real_a_in <= std_logic_vector(to_signed(0, real_a_in'length));
                    imag_a_in <= std_logic_vector(to_signed(0, imag_a_in'length));
                    real_b_in <= std_logic_vector(to_signed(0, real_b_in'length));
                    imag_b_in <= std_logic_vector(to_signed(0, imag_b_in'length));
                    twiddle_cos_real_var := 0;
                    twiddle_sin_imag_var := 0;
                    real_a_in_var := 0;
                    imag_a_in_var := 0;
                    real_b_in_var := 0;
                    imag_b_in_var := 0;
                when 1 =>
                    -- real result from Octave (Matlab) testing
                    twiddle_cos_real <= std_logic_vector(to_signed(-98, twiddle_cos_real'length));
                    twiddle_sin_imag <= std_logic_vector(to_signed(236, twiddle_sin_imag'length));
                    real_a_in <= std_logic_vector(to_signed(121, real_a_in'length));
                    imag_a_in <= std_logic_vector(to_signed(47, imag_a_in'length));
                    real_b_in <= std_logic_vector(to_signed(2, real_b_in'length));
                    imag_b_in <= std_logic_vector(to_signed(130, imag_b_in'length));
                    twiddle_cos_real_var := -98;
                    twiddle_sin_imag_var := 236;
                    real_a_in_var := 121;
                    imag_a_in_var := 47;
                    real_b_in_var := 2;
                    imag_b_in_var := 130;
                when 2 =>
                    -- maximum values for 9 bit signed, excluding -256
                    twiddle_cos_real <= std_logic_vector(to_signed(255, twiddle_cos_real'length));
                    twiddle_sin_imag <= std_logic_vector(to_signed(255, twiddle_sin_imag'length));
                    real_a_in <= std_logic_vector(to_signed(255, real_a_in'length));
                    imag_a_in <= std_logic_vector(to_signed(255, imag_a_in'length));
                    real_b_in <= std_logic_vector(to_signed(255, real_b_in'length));
                    imag_b_in <= std_logic_vector(to_signed(255, imag_b_in'length));
                    twiddle_cos_real_var := 255;
                    twiddle_sin_imag_var := 255;
                    real_a_in_var := 255;
                    imag_a_in_var := 255;
                    real_b_in_var := 255;
                    imag_b_in_var := 255;
                when 3 =>
                    -- minimum values for 9 bit signed, excluding -256
                    twiddle_cos_real <= std_logic_vector(to_signed(255, twiddle_cos_real'length));
                    twiddle_sin_imag <= std_logic_vector(to_signed(255, twiddle_sin_imag'length));
                    real_a_in <= std_logic_vector(to_signed(-255, real_a_in'length));
                    imag_a_in <= std_logic_vector(to_signed(-255, imag_a_in'length));
                    real_b_in <= std_logic_vector(to_signed(-255, real_b_in'length));
                    imag_b_in <= std_logic_vector(to_signed(-255, imag_b_in'length));
                    twiddle_cos_real_var := 255;
                    twiddle_sin_imag_var := 255;
                    real_a_in_var := -255;
                    imag_a_in_var := -255;
                    real_b_in_var := -255;
                    imag_b_in_var := -255;
                when others =>
                    -- random values are between 0 and 1.
                    -- Oversizing the integer value and converting to signed will truncate the highest bits
                    -- this allows the highest value bit to be used as the sign bit allowing for negative input values
                    -- this also throws "truncate" warnings in Modelsim
                    uniform(seed1, seed2, x1);
                    twiddle_cos_real <= std_logic_vector(to_signed(integer(floor(x1 * 2.0**9)), twiddle_cos_real'length));
                    twiddle_cos_real_var := to_integer(to_signed(integer(floor(x1 * 2.0**9)), twiddle_cos_real'length));
                    uniform(seed1, seed2, x1);
                    twiddle_sin_imag <= std_logic_vector(to_signed(integer(floor(x1 * 2.0**9)), twiddle_sin_imag'length));
                    twiddle_sin_imag_var := to_integer(to_signed(integer(floor(x1 * 2.0**9)), twiddle_sin_imag'length));
                    uniform(seed1, seed2, x1);
                    real_a_in <= std_logic_vector(to_signed(integer(floor(x1 * 2.0**9)), real_a_in'length));
                    real_a_in_var := to_integer(to_signed(integer(floor(x1 * 2.0**9)), real_a_in'length));
                    uniform(seed1, seed2, x1);
                    imag_a_in <= std_logic_vector(to_signed(integer(floor(x1 * 2.0**9)), imag_a_in'length));
                    imag_a_in_var := to_integer(to_signed(integer(floor(x1 * 2.0**9)), imag_a_in'length));
                    uniform(seed1, seed2, x1);
                    real_b_in <= std_logic_vector(to_signed(integer(floor(x1 * 2.0**9)), real_b_in'length));
                    real_b_in_var := to_integer(to_signed(integer(floor(x1 * 2.0**9)), real_b_in'length));
                    uniform(seed1, seed2, x1);
                    imag_b_in <= std_logic_vector(to_signed(integer(floor(x1 * 2.0**9)), imag_b_in'length));
                    imag_b_in_var := to_integer(to_signed(integer(floor(x1 * 2.0**9)), imag_b_in'length));
            end case;

            temp_real_var := ((real_a_in_var * twiddle_cos_real_var) + (imag_a_in_var * twiddle_sin_imag_var));-- / (2**8);
            temp_imag_var := ((imag_a_in_var * twiddle_cos_real_var) - (real_a_in_var * twiddle_sin_imag_var));-- / (2**8);
            
            -- integer rounding needs to mimic the hardware implementation, this means floor() but matching all the data types is a mess.
            temp2_real_var := to_integer(shift_right(to_signed(temp_real_var, 32), 9));
            temp2_imag_var := to_integer(shift_right(to_signed(temp_imag_var, 32), 9));

            real_a_out_var := to_integer(shift_right(to_signed(real_b_in_var - temp2_real_var, 32), 1));-- / (2**1);
            imag_a_out_var := to_integer(shift_right(to_signed(imag_b_in_var - temp2_imag_var, 32), 1));-- / (2**1);
            real_b_out_var := to_integer(shift_right(to_signed(real_b_in_var + temp2_real_var, 32), 1));-- / (2**1);
            imag_b_out_var := to_integer(shift_right(to_signed(imag_b_in_var + temp2_imag_var, 32), 1));-- / (2**1);

            
            wait for (SYSCLK_PERIOD * 1);
            report integer'image(temp2_real_var) & " = " & integer'image(real_a_in_var) & " * " & integer'image(twiddle_cos_real_var) & " + " & integer'image(imag_a_in_var) & " * " & integer'image(twiddle_sin_imag_var);
            report integer'image(temp2_imag_var) & " = " & integer'image(imag_a_in_var) & " * " & integer'image(twiddle_cos_real_var) & " - " & integer'image(real_a_in_var) & " * " & integer'image(twiddle_sin_imag_var);
            
            assert (real_a_out = std_logic_vector(to_signed(real_a_out_var, real_a_out'length))) report "result error: real_a_out; " & integer'image(to_integer(signed(real_a_out))) & " /= " & integer'image(real_a_out_var);
            assert (imag_a_out = std_logic_vector(to_signed(imag_a_out_var, imag_a_out'length))) report "result error: imag_a_out; " & integer'image(to_integer(signed(imag_a_out))) & " /= " & integer'image(imag_a_out_var);
            assert (real_b_out = std_logic_vector(to_signed(real_b_out_var, real_b_out'length))) report "result error: real_b_out; " & integer'image(to_integer(signed(real_b_out))) & " /= " & integer'image(real_b_out_var);
            assert (imag_b_out = std_logic_vector(to_signed(imag_b_out_var, imag_b_out'length))) report "result error: imag_b_out; " & integer'image(to_integer(signed(imag_b_out))) & " /= " & integer'image(imag_b_out_var);
            wait for (SYSCLK_PERIOD * 1);
        end loop;

        wait;
    end process;

end behavioral;
