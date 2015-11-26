-- $Id: opb_emc_wrap.vhd,v 1.1 2004/09/09 15:39:59 gburch Exp $

-- opb_emc_wrap.vhd
--   Generated by z:wrapgen, v1.01j Aug 18,2004 6:26:29

library ieee;

use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
-- entity
-------------------------------------------------------------------------------

entity opb_emc_wrap is
  generic
  (
    C_NUM_BANKS_MEM                : integer          := 2;
    C_INCLUDE_BURST                : integer          := 0;
    C_INCLUDE_NEGEDGE_IOREGS       : integer          := 0;
    C_FAMILY                       : string           := "virtex2";
    C_MEM0_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
    C_MEM0_HIGHADDR                : std_logic_vector := X"0000_0000";
    C_MEM1_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
    C_MEM1_HIGHADDR                : std_logic_vector := X"0000_0000";
    C_MEM2_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
    C_MEM2_HIGHADDR                : std_logic_vector := X"0000_0000";
    C_MEM3_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
    C_MEM3_HIGHADDR                : std_logic_vector := X"0000_0000";
    C_MEM0_WIDTH                   : integer          := 32;
    C_MEM1_WIDTH                   : integer          := 32;
    C_MEM2_WIDTH                   : integer          := 32;
    C_MEM3_WIDTH                   : integer          := 32;
    C_MAX_MEM_WIDTH                : integer          := 32;
    C_INCLUDE_DATAWIDTH_MATCHING_0 : integer          := 1;
    C_INCLUDE_DATAWIDTH_MATCHING_1 : integer          := 1;
    C_INCLUDE_DATAWIDTH_MATCHING_2 : integer          := 1;
    C_INCLUDE_DATAWIDTH_MATCHING_3 : integer          := 1;
    C_SYNCH_MEM_0                  : integer          := 0;
    C_SYNCH_PIPEDELAY_0            : integer          := 2;
    C_TCEDV_PS_MEM_0               : integer          := 15000;
    C_TAVDV_PS_MEM_0               : integer          := 15000;
    C_THZCE_PS_MEM_0               : integer          := 7000;
    C_THZOE_PS_MEM_0               : integer          := 7000;
    C_TWC_PS_MEM_0                 : integer          := 15000;
    C_TWP_PS_MEM_0                 : integer          := 12000;
    C_TLZWE_PS_MEM_0               : integer          := 0;
    C_SYNCH_MEM_1                  : integer          := 0;
    C_SYNCH_PIPEDELAY_1            : integer          := 2;
    C_TCEDV_PS_MEM_1               : integer          := 15000;
    C_TAVDV_PS_MEM_1               : integer          := 15000;
    C_THZCE_PS_MEM_1               : integer          := 7000;
    C_THZOE_PS_MEM_1               : integer          := 7000;
    C_TWC_PS_MEM_1                 : integer          := 15000;
    C_TWP_PS_MEM_1                 : integer          := 12000;
    C_TLZWE_PS_MEM_1               : integer          := 0;
    C_SYNCH_MEM_2                  : integer          := 0;
    C_SYNCH_PIPEDELAY_2            : integer          := 2;
    C_TCEDV_PS_MEM_2               : integer          := 15000;
    C_TAVDV_PS_MEM_2               : integer          := 15000;
    C_THZCE_PS_MEM_2               : integer          := 7000;
    C_THZOE_PS_MEM_2               : integer          := 7000;
    C_TWC_PS_MEM_2                 : integer          := 15000;
    C_TWP_PS_MEM_2                 : integer          := 12000;
    C_TLZWE_PS_MEM_2               : integer          := 0;
    C_SYNCH_MEM_3                  : integer          := 0;
    C_SYNCH_PIPEDELAY_3            : integer          := 2;
    C_TCEDV_PS_MEM_3               : integer          := 15000;
    C_TAVDV_PS_MEM_3               : integer          := 15000;
    C_THZCE_PS_MEM_3               : integer          := 7000;
    C_THZOE_PS_MEM_3               : integer          := 7000;
    C_TWC_PS_MEM_3                 : integer          := 15000;
    C_TWP_PS_MEM_3                 : integer          := 12000;
    C_TLZWE_PS_MEM_3               : integer          := 0;
    C_OPB_DWIDTH                   : integer          := 32;
    C_OPB_AWIDTH                   : integer          := 32;
    C_OPB_CLK_PERIOD_PS            : integer          := 10000
  );
  port
  (
    OPB_Clk     : in  std_logic;
    OPB_Rst     : in  std_logic;
    OPB_ABus    : in  std_logic_vector(0 to C_OPB_AWIDTH - 1 );
    OPB_DBus    : in  std_logic_vector(0 to C_OPB_DWIDTH - 1 );
    Sln_DBus    : out std_logic_vector(0 to C_OPB_DWIDTH - 1 );
    OPB_select  : in  std_logic                                  := '0';
    OPB_RNW     : in  std_logic                                  := '0';
    OPB_seqAddr : in  std_logic                                  := '0';
    OPB_BE      : in  std_logic_vector(0 to C_OPB_DWIDTH/8 - 1 );
    Sln_xferAck : out std_logic;
    Sln_errAck  : out std_logic;
    Sln_toutSup : out std_logic;
    Sln_retry   : out std_logic;
    Mem_A       : out std_logic_vector(0 to C_OPB_AWIDTH-1);
    Mem_DQ_I    : in  std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
    Mem_DQ_O    : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
    Mem_DQ_T    : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
    Mem_CEN     : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
    Mem_OEN     : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
    Mem_WEN     : out std_logic;
    Mem_QWEN    : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
    Mem_BEN     : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
    Mem_RPN     : out std_logic;
    Mem_CE      : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
    Mem_ADV_LDN : out std_logic;
    Mem_LBON    : out std_logic;
    Mem_CKEN    : out std_logic;
    Mem_RNW     : out std_logic
  );
end entity opb_emc_wrap;

-------------------------------------------------------------------------------
-- architecture
-------------------------------------------------------------------------------

architecture imp of opb_emc_wrap is

  component opb_emc is
    generic
    (
      C_NUM_BANKS_MEM                : integer          := 2;
      C_INCLUDE_BURST                : integer          := 0;
      C_INCLUDE_NEGEDGE_IOREGS       : integer          := 0;
      C_FAMILY                       : string           := "virtex2";
      C_MEM0_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
      C_MEM0_HIGHADDR                : std_logic_vector := X"0000_0000";
      C_MEM1_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
      C_MEM1_HIGHADDR                : std_logic_vector := X"0000_0000";
      C_MEM2_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
      C_MEM2_HIGHADDR                : std_logic_vector := X"0000_0000";
      C_MEM3_BASEADDR                : std_logic_vector := X"FFFF_FFFF";
      C_MEM3_HIGHADDR                : std_logic_vector := X"0000_0000";
      C_MEM0_WIDTH                   : integer          := 32;
      C_MEM1_WIDTH                   : integer          := 32;
      C_MEM2_WIDTH                   : integer          := 32;
      C_MEM3_WIDTH                   : integer          := 32;
      C_MAX_MEM_WIDTH                : integer          := 32;
      C_INCLUDE_DATAWIDTH_MATCHING_0 : integer          := 1;
      C_INCLUDE_DATAWIDTH_MATCHING_1 : integer          := 1;
      C_INCLUDE_DATAWIDTH_MATCHING_2 : integer          := 1;
      C_INCLUDE_DATAWIDTH_MATCHING_3 : integer          := 1;
      C_SYNCH_MEM_0                  : integer          := 0;
      C_SYNCH_PIPEDELAY_0            : integer          := 2;
      C_TCEDV_PS_MEM_0               : integer          := 15000;
      C_TAVDV_PS_MEM_0               : integer          := 15000;
      C_THZCE_PS_MEM_0               : integer          := 7000;
      C_THZOE_PS_MEM_0               : integer          := 7000;
      C_TWC_PS_MEM_0                 : integer          := 15000;
      C_TWP_PS_MEM_0                 : integer          := 12000;
      C_TLZWE_PS_MEM_0               : integer          := 0;
      C_SYNCH_MEM_1                  : integer          := 0;
      C_SYNCH_PIPEDELAY_1            : integer          := 2;
      C_TCEDV_PS_MEM_1               : integer          := 15000;
      C_TAVDV_PS_MEM_1               : integer          := 15000;
      C_THZCE_PS_MEM_1               : integer          := 7000;
      C_THZOE_PS_MEM_1               : integer          := 7000;
      C_TWC_PS_MEM_1                 : integer          := 15000;
      C_TWP_PS_MEM_1                 : integer          := 12000;
      C_TLZWE_PS_MEM_1               : integer          := 0;
      C_SYNCH_MEM_2                  : integer          := 0;
      C_SYNCH_PIPEDELAY_2            : integer          := 2;
      C_TCEDV_PS_MEM_2               : integer          := 15000;
      C_TAVDV_PS_MEM_2               : integer          := 15000;
      C_THZCE_PS_MEM_2               : integer          := 7000;
      C_THZOE_PS_MEM_2               : integer          := 7000;
      C_TWC_PS_MEM_2                 : integer          := 15000;
      C_TWP_PS_MEM_2                 : integer          := 12000;
      C_TLZWE_PS_MEM_2               : integer          := 0;
      C_SYNCH_MEM_3                  : integer          := 0;
      C_SYNCH_PIPEDELAY_3            : integer          := 2;
      C_TCEDV_PS_MEM_3               : integer          := 15000;
      C_TAVDV_PS_MEM_3               : integer          := 15000;
      C_THZCE_PS_MEM_3               : integer          := 7000;
      C_THZOE_PS_MEM_3               : integer          := 7000;
      C_TWC_PS_MEM_3                 : integer          := 15000;
      C_TWP_PS_MEM_3                 : integer          := 12000;
      C_TLZWE_PS_MEM_3               : integer          := 0;
      C_OPB_DWIDTH                   : integer          := 32;
      C_OPB_AWIDTH                   : integer          := 32;
      C_OPB_CLK_PERIOD_PS            : integer          := 10000
    );
    port
    (
      OPB_Clk     : in  std_logic;
      OPB_Rst     : in  std_logic;
      OPB_ABus    : in  std_logic_vector(0 to C_OPB_AWIDTH - 1 );
      OPB_DBus    : in  std_logic_vector(0 to C_OPB_DWIDTH - 1 );
      Sln_DBus    : out std_logic_vector(0 to C_OPB_DWIDTH - 1 );
      OPB_select  : in  std_logic                                  := '0';
      OPB_RNW     : in  std_logic                                  := '0';
      OPB_seqAddr : in  std_logic                                  := '0';
      OPB_BE      : in  std_logic_vector(0 to C_OPB_DWIDTH/8 - 1 );
      Sln_xferAck : out std_logic;
      Sln_errAck  : out std_logic;
      Sln_toutSup : out std_logic;
      Sln_retry   : out std_logic;
      Mem_A       : out std_logic_vector(0 to C_OPB_AWIDTH-1);
      Mem_DQ_I    : in  std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
      Mem_DQ_O    : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
      Mem_DQ_T    : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
      Mem_CEN     : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_OEN     : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_WEN     : out std_logic;
      Mem_QWEN    : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_BEN     : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_RPN     : out std_logic;
      Mem_CE      : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_ADV_LDN : out std_logic;
      Mem_LBON    : out std_logic;
      Mem_CKEN    : out std_logic;
      Mem_RNW     : out std_logic
    );
  end component opb_emc;

begin  ------------------------------------------------------------------------

  OPB_EMC_I : opb_emc
    generic map
    (
      C_NUM_BANKS_MEM                => C_NUM_BANKS_MEM,
      C_INCLUDE_BURST                => C_INCLUDE_BURST,
      C_INCLUDE_NEGEDGE_IOREGS       => C_INCLUDE_NEGEDGE_IOREGS,
      C_FAMILY                       => C_FAMILY,
      C_MEM0_BASEADDR                => C_MEM0_BASEADDR,
      C_MEM0_HIGHADDR                => C_MEM0_HIGHADDR,
      C_MEM1_BASEADDR                => C_MEM1_BASEADDR,
      C_MEM1_HIGHADDR                => C_MEM1_HIGHADDR,
      C_MEM2_BASEADDR                => C_MEM2_BASEADDR,
      C_MEM2_HIGHADDR                => C_MEM2_HIGHADDR,
      C_MEM3_BASEADDR                => C_MEM3_BASEADDR,
      C_MEM3_HIGHADDR                => C_MEM3_HIGHADDR,
      C_MEM0_WIDTH                   => C_MEM0_WIDTH,
      C_MEM1_WIDTH                   => C_MEM1_WIDTH,
      C_MEM2_WIDTH                   => C_MEM2_WIDTH,
      C_MEM3_WIDTH                   => C_MEM3_WIDTH,
      C_MAX_MEM_WIDTH                => C_MAX_MEM_WIDTH,
      C_INCLUDE_DATAWIDTH_MATCHING_0 => C_INCLUDE_DATAWIDTH_MATCHING_0,
      C_INCLUDE_DATAWIDTH_MATCHING_1 => C_INCLUDE_DATAWIDTH_MATCHING_1,
      C_INCLUDE_DATAWIDTH_MATCHING_2 => C_INCLUDE_DATAWIDTH_MATCHING_2,
      C_INCLUDE_DATAWIDTH_MATCHING_3 => C_INCLUDE_DATAWIDTH_MATCHING_3,
      C_SYNCH_MEM_0                  => C_SYNCH_MEM_0,
      C_SYNCH_PIPEDELAY_0            => C_SYNCH_PIPEDELAY_0,
      C_TCEDV_PS_MEM_0               => C_TCEDV_PS_MEM_0,
      C_TAVDV_PS_MEM_0               => C_TAVDV_PS_MEM_0,
      C_THZCE_PS_MEM_0               => C_THZCE_PS_MEM_0,
      C_THZOE_PS_MEM_0               => C_THZOE_PS_MEM_0,
      C_TWC_PS_MEM_0                 => C_TWC_PS_MEM_0,
      C_TWP_PS_MEM_0                 => C_TWP_PS_MEM_0,
      C_TLZWE_PS_MEM_0               => C_TLZWE_PS_MEM_0,
      C_SYNCH_MEM_1                  => C_SYNCH_MEM_1,
      C_SYNCH_PIPEDELAY_1            => C_SYNCH_PIPEDELAY_1,
      C_TCEDV_PS_MEM_1               => C_TCEDV_PS_MEM_1,
      C_TAVDV_PS_MEM_1               => C_TAVDV_PS_MEM_1,
      C_THZCE_PS_MEM_1               => C_THZCE_PS_MEM_1,
      C_THZOE_PS_MEM_1               => C_THZOE_PS_MEM_1,
      C_TWC_PS_MEM_1                 => C_TWC_PS_MEM_1,
      C_TWP_PS_MEM_1                 => C_TWP_PS_MEM_1,
      C_TLZWE_PS_MEM_1               => C_TLZWE_PS_MEM_1,
      C_SYNCH_MEM_2                  => C_SYNCH_MEM_2,
      C_SYNCH_PIPEDELAY_2            => C_SYNCH_PIPEDELAY_2,
      C_TCEDV_PS_MEM_2               => C_TCEDV_PS_MEM_2,
      C_TAVDV_PS_MEM_2               => C_TAVDV_PS_MEM_2,
      C_THZCE_PS_MEM_2               => C_THZCE_PS_MEM_2,
      C_THZOE_PS_MEM_2               => C_THZOE_PS_MEM_2,
      C_TWC_PS_MEM_2                 => C_TWC_PS_MEM_2,
      C_TWP_PS_MEM_2                 => C_TWP_PS_MEM_2,
      C_TLZWE_PS_MEM_2               => C_TLZWE_PS_MEM_2,
      C_SYNCH_MEM_3                  => C_SYNCH_MEM_3,
      C_SYNCH_PIPEDELAY_3            => C_SYNCH_PIPEDELAY_3,
      C_TCEDV_PS_MEM_3               => C_TCEDV_PS_MEM_3,
      C_TAVDV_PS_MEM_3               => C_TAVDV_PS_MEM_3,
      C_THZCE_PS_MEM_3               => C_THZCE_PS_MEM_3,
      C_THZOE_PS_MEM_3               => C_THZOE_PS_MEM_3,
      C_TWC_PS_MEM_3                 => C_TWC_PS_MEM_3,
      C_TWP_PS_MEM_3                 => C_TWP_PS_MEM_3,
      C_TLZWE_PS_MEM_3               => C_TLZWE_PS_MEM_3,
      C_OPB_DWIDTH                   => C_OPB_DWIDTH,
      C_OPB_AWIDTH                   => C_OPB_AWIDTH,
      C_OPB_CLK_PERIOD_PS            => C_OPB_CLK_PERIOD_PS
    )
    port map
    (
      OPB_Clk     => OPB_Clk,
      OPB_Rst     => OPB_Rst,
      OPB_ABus    => OPB_ABus,
      OPB_DBus    => OPB_DBus,
      Sln_DBus    => Sln_DBus,
      OPB_select  => OPB_select,
      OPB_RNW     => OPB_RNW,
      OPB_seqAddr => OPB_seqAddr,
      OPB_BE      => OPB_BE,
      Sln_xferAck => Sln_xferAck,
      Sln_errAck  => Sln_errAck,
      Sln_toutSup => Sln_toutSup,
      Sln_retry   => Sln_retry,
      Mem_A       => Mem_A,
      Mem_DQ_I    => Mem_DQ_I,
      Mem_DQ_O    => Mem_DQ_O,
      Mem_DQ_T    => Mem_DQ_T,
      Mem_CEN     => Mem_CEN,
      Mem_OEN     => Mem_OEN,
      Mem_WEN     => Mem_WEN,
      Mem_QWEN    => Mem_QWEN,
      Mem_BEN     => Mem_BEN,
      Mem_RPN     => Mem_RPN,
      Mem_CE      => Mem_CE,
      Mem_ADV_LDN => Mem_ADV_LDN,
      Mem_LBON    => Mem_LBON,
      Mem_CKEN    => Mem_CKEN,
      Mem_RNW     => Mem_RNW
    );

end architecture imp;
