----------------------------------------------------------------------
-- Created by SmartDesign Sat Oct 26 15:53:20 2019
-- Version: v12.1 12.600.0.14
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
----------------------------------------------------------------------
-- CoreAPB3_C0 entity declaration
----------------------------------------------------------------------
entity CoreAPB3_C0 is
    -- Port list
    port(
        -- Inputs
        PADDR     : in  std_logic_vector(31 downto 0);
        PENABLE   : in  std_logic;
        PRDATAS1  : in  std_logic_vector(31 downto 0);
        PRDATAS2  : in  std_logic_vector(31 downto 0);
        PREADYS1  : in  std_logic;
        PREADYS2  : in  std_logic;
        PSEL      : in  std_logic;
        PSLVERRS1 : in  std_logic;
        PSLVERRS2 : in  std_logic;
        PWDATA    : in  std_logic_vector(31 downto 0);
        PWRITE    : in  std_logic;
        -- Outputs
        PADDRS    : out std_logic_vector(31 downto 0);
        PENABLES  : out std_logic;
        PRDATA    : out std_logic_vector(31 downto 0);
        PREADY    : out std_logic;
        PSELS1    : out std_logic;
        PSELS2    : out std_logic;
        PSLVERR   : out std_logic;
        PWDATAS   : out std_logic_vector(31 downto 0);
        PWRITES   : out std_logic
        );
end CoreAPB3_C0;
----------------------------------------------------------------------
-- CoreAPB3_C0 architecture body
----------------------------------------------------------------------
architecture RTL of CoreAPB3_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
-- using entity instantiation for component CoreAPB3
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal APB3mmaster_PRDATA         : std_logic_vector(31 downto 0);
signal APB3mmaster_PREADY         : std_logic;
signal APB3mmaster_PSLVERR        : std_logic;
signal APBmslave1_2_PADDR         : std_logic_vector(31 downto 0);
signal APBmslave1_2_PENABLE       : std_logic;
signal APBmslave1_2_PSELx         : std_logic;
signal APBmslave1_2_PWDATA        : std_logic_vector(31 downto 0);
signal APBmslave1_2_PWRITE        : std_logic;
signal APBmslave2_2_PSELx         : std_logic;
signal APB3mmaster_PREADY_net_0   : std_logic;
signal APB3mmaster_PSLVERR_net_0  : std_logic;
signal APBmslave1_2_PSELx_net_0   : std_logic;
signal APBmslave1_2_PENABLE_net_0 : std_logic;
signal APBmslave1_2_PWRITE_net_0  : std_logic;
signal APBmslave2_2_PSELx_net_0   : std_logic;
signal APB3mmaster_PRDATA_net_0   : std_logic_vector(31 downto 0);
signal APBmslave1_2_PADDR_net_0   : std_logic_vector(31 downto 0);
signal APBmslave1_2_PWDATA_net_0  : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                    : std_logic;
signal VCC_net                    : std_logic;
signal IADDR_const_net_0          : std_logic_vector(31 downto 0);
signal PRDATAS0_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS3_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS4_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS5_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS6_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS7_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS8_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS9_const_net_0       : std_logic_vector(31 downto 0);
signal PRDATAS10_const_net_0      : std_logic_vector(31 downto 0);
signal PRDATAS11_const_net_0      : std_logic_vector(31 downto 0);
signal PRDATAS12_const_net_0      : std_logic_vector(31 downto 0);
signal PRDATAS13_const_net_0      : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0      : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0      : std_logic_vector(31 downto 0);
signal PRDATAS16_const_net_0      : std_logic_vector(31 downto 0);

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net               <= '0';
 VCC_net               <= '1';
 IADDR_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS0_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS3_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS4_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS5_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS6_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS7_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS8_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS9_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS10_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS11_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS12_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS13_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0 <= B"00000000000000000000000000000000";
 PRDATAS16_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 APB3mmaster_PREADY_net_0   <= APB3mmaster_PREADY;
 PREADY                     <= APB3mmaster_PREADY_net_0;
 APB3mmaster_PSLVERR_net_0  <= APB3mmaster_PSLVERR;
 PSLVERR                    <= APB3mmaster_PSLVERR_net_0;
 APBmslave1_2_PSELx_net_0   <= APBmslave1_2_PSELx;
 PSELS1                     <= APBmslave1_2_PSELx_net_0;
 APBmslave1_2_PENABLE_net_0 <= APBmslave1_2_PENABLE;
 PENABLES                   <= APBmslave1_2_PENABLE_net_0;
 APBmslave1_2_PWRITE_net_0  <= APBmslave1_2_PWRITE;
 PWRITES                    <= APBmslave1_2_PWRITE_net_0;
 APBmslave2_2_PSELx_net_0   <= APBmslave2_2_PSELx;
 PSELS2                     <= APBmslave2_2_PSELx_net_0;
 APB3mmaster_PRDATA_net_0   <= APB3mmaster_PRDATA;
 PRDATA(31 downto 0)        <= APB3mmaster_PRDATA_net_0;
 APBmslave1_2_PADDR_net_0   <= APBmslave1_2_PADDR;
 PADDRS(31 downto 0)        <= APBmslave1_2_PADDR_net_0;
 APBmslave1_2_PWDATA_net_0  <= APBmslave1_2_PWDATA;
 PWDATAS(31 downto 0)       <= APBmslave1_2_PWDATA_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CoreAPB3_C0_0   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3_C0_0 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 8 ),
        APBSLOT0ENABLE  => ( 0 ),
        APBSLOT1ENABLE  => ( 1 ),
        APBSLOT2ENABLE  => ( 1 ),
        APBSLOT3ENABLE  => ( 0 ),
        APBSLOT4ENABLE  => ( 0 ),
        APBSLOT5ENABLE  => ( 0 ),
        APBSLOT6ENABLE  => ( 0 ),
        APBSLOT7ENABLE  => ( 0 ),
        APBSLOT8ENABLE  => ( 0 ),
        APBSLOT9ENABLE  => ( 0 ),
        APBSLOT10ENABLE => ( 0 ),
        APBSLOT11ENABLE => ( 0 ),
        APBSLOT12ENABLE => ( 0 ),
        APBSLOT13ENABLE => ( 0 ),
        APBSLOT14ENABLE => ( 0 ),
        APBSLOT15ENABLE => ( 0 ),
        FAMILY          => ( 19 ),
        IADDR_OPTION    => ( 0 ),
        MADDR_BITS      => ( 12 ),
        SC_0            => ( 0 ),
        SC_1            => ( 0 ),
        SC_2            => ( 0 ),
        SC_3            => ( 0 ),
        SC_4            => ( 0 ),
        SC_5            => ( 0 ),
        SC_6            => ( 0 ),
        SC_7            => ( 0 ),
        SC_8            => ( 0 ),
        SC_9            => ( 0 ),
        SC_10           => ( 0 ),
        SC_11           => ( 0 ),
        SC_12           => ( 0 ),
        SC_13           => ( 0 ),
        SC_14           => ( 0 ),
        SC_15           => ( 0 ),
        UPR_NIBBLE_POSN => ( 8 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PWRITE     => PWRITE,
        PENABLE    => PENABLE,
        PSEL       => PSEL,
        PREADYS0   => VCC_net, -- tied to '1' from definition
        PSLVERRS0  => GND_net, -- tied to '0' from definition
        PREADYS1   => PREADYS1,
        PSLVERRS1  => PSLVERRS1,
        PREADYS2   => PREADYS2,
        PSLVERRS2  => PSLVERRS2,
        PREADYS3   => VCC_net, -- tied to '1' from definition
        PSLVERRS3  => GND_net, -- tied to '0' from definition
        PREADYS4   => VCC_net, -- tied to '1' from definition
        PSLVERRS4  => GND_net, -- tied to '0' from definition
        PREADYS5   => VCC_net, -- tied to '1' from definition
        PSLVERRS5  => GND_net, -- tied to '0' from definition
        PREADYS6   => VCC_net, -- tied to '1' from definition
        PSLVERRS6  => GND_net, -- tied to '0' from definition
        PREADYS7   => VCC_net, -- tied to '1' from definition
        PSLVERRS7  => GND_net, -- tied to '0' from definition
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        PADDR      => PADDR,
        PWDATA     => PWDATA,
        PRDATAS0   => PRDATAS0_const_net_0, -- tied to X"0" from definition
        PRDATAS1   => PRDATAS1,
        PRDATAS2   => PRDATAS2,
        PRDATAS3   => PRDATAS3_const_net_0, -- tied to X"0" from definition
        PRDATAS4   => PRDATAS4_const_net_0, -- tied to X"0" from definition
        PRDATAS5   => PRDATAS5_const_net_0, -- tied to X"0" from definition
        PRDATAS6   => PRDATAS6_const_net_0, -- tied to X"0" from definition
        PRDATAS7   => PRDATAS7_const_net_0, -- tied to X"0" from definition
        PRDATAS8   => PRDATAS8_const_net_0, -- tied to X"0" from definition
        PRDATAS9   => PRDATAS9_const_net_0, -- tied to X"0" from definition
        PRDATAS10  => PRDATAS10_const_net_0, -- tied to X"0" from definition
        PRDATAS11  => PRDATAS11_const_net_0, -- tied to X"0" from definition
        PRDATAS12  => PRDATAS12_const_net_0, -- tied to X"0" from definition
        PRDATAS13  => PRDATAS13_const_net_0, -- tied to X"0" from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        PRDATAS16  => PRDATAS16_const_net_0, -- tied to X"0" from definition
        IADDR      => IADDR_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PREADY     => APB3mmaster_PREADY,
        PSLVERR    => APB3mmaster_PSLVERR,
        PWRITES    => APBmslave1_2_PWRITE,
        PENABLES   => APBmslave1_2_PENABLE,
        PSELS0     => OPEN,
        PSELS1     => APBmslave1_2_PSELx,
        PSELS2     => APBmslave2_2_PSELx,
        PSELS3     => OPEN,
        PSELS4     => OPEN,
        PSELS5     => OPEN,
        PSELS6     => OPEN,
        PSELS7     => OPEN,
        PSELS8     => OPEN,
        PSELS9     => OPEN,
        PSELS10    => OPEN,
        PSELS11    => OPEN,
        PSELS12    => OPEN,
        PSELS13    => OPEN,
        PSELS14    => OPEN,
        PSELS15    => OPEN,
        PSELS16    => OPEN,
        PRDATA     => APB3mmaster_PRDATA,
        PADDRS     => APBmslave1_2_PADDR,
        PWDATAS    => APBmslave1_2_PWDATA 
        );

end RTL;