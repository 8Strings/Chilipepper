-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Branch\Chilipepper\Labs\Lab_2\MATLAB\codegen\mcu_driver\hdlsrc\mcu_driver_pcore_axi_lite.vhd
-- Created: 2013-11-18 13:30:50
-- 
-- Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mcu_driver_pcore_axi_lite
-- Source Path: mcu_driver_pcore/mcu_driver_pcore_axi_lite
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mcu_driver_pcore_axi_lite IS
  PORT( reset                             :   IN    std_logic;
        AXI_Lite_ACLK                     :   IN    std_logic;  -- ufix1
        AXI_Lite_ARESETN                  :   IN    std_logic;  -- ufix1
        AXI_Lite_AWADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_AWVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_WDATA                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_WSTRB                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI_Lite_WVALID                   :   IN    std_logic;  -- ufix1
        AXI_Lite_BREADY                   :   IN    std_logic;  -- ufix1
        AXI_Lite_ARADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_ARVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_RREADY                   :   IN    std_logic;  -- ufix1
        read_init_done_reg                :   IN    std_logic;  -- ufix1
        read_latch_done                   :   IN    std_logic;  -- ufix1
        read_reg_reset_done               :   IN    std_logic;  -- ufix1
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic;  -- ufix1
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_mcu_reset_in                :   OUT   std_logic;  -- ufix1
        write_tr_sw_reg                   :   OUT   std_logic;  -- ufix1
        write_pa_en_reg                   :   OUT   std_logic;  -- ufix1
        write_tx_en_reg                   :   OUT   std_logic;  -- ufix1
        write_rx_en_reg                   :   OUT   std_logic;  -- ufix1
        write_latch                       :   OUT   std_logic;  -- ufix1
        write_mcu_reg_reset               :   OUT   std_logic;  -- ufix1
        reset_internal                    :   OUT   std_logic  -- ufix1
        );
END mcu_driver_pcore_axi_lite;


ARCHITECTURE rtl OF mcu_driver_pcore_axi_lite IS

  -- Component Declarations
  COMPONENT mcu_driver_pcore_addr_decoder
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          data_write                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   IN    std_logic;  -- ufix1
          rd_enb                          :   IN    std_logic;  -- ufix1
          read_init_done_reg              :   IN    std_logic;  -- ufix1
          read_latch_done                 :   IN    std_logic;  -- ufix1
          read_reg_reset_done             :   IN    std_logic;  -- ufix1
          data_read                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_mcu_reset_in              :   OUT   std_logic;  -- ufix1
          write_tr_sw_reg                 :   OUT   std_logic;  -- ufix1
          write_pa_en_reg                 :   OUT   std_logic;  -- ufix1
          write_tx_en_reg                 :   OUT   std_logic;  -- ufix1
          write_rx_en_reg                 :   OUT   std_logic;  -- ufix1
          write_latch                     :   OUT   std_logic;  -- ufix1
          write_mcu_reg_reset             :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mcu_driver_pcore_axi_lite_module
    PORT( clk                             :   IN    std_logic;  -- ufix1
          AXI_Lite_ARESETN                :   IN    std_logic;  -- ufix1
          AXI_Lite_AWADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_WDATA                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_WSTRB                  :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI_Lite_WVALID                 :   IN    std_logic;  -- ufix1
          AXI_Lite_BREADY                 :   IN    std_logic;  -- ufix1
          AXI_Lite_ARADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_ARVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_RREADY                 :   IN    std_logic;  -- ufix1
          data_read                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          data_write                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   OUT   std_logic;  -- ufix1
          rd_enb                          :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mcu_driver_pcore_addr_decoder
    USE ENTITY work.mcu_driver_pcore_addr_decoder(rtl);

  FOR ALL : mcu_driver_pcore_axi_lite_module
    USE ENTITY work.mcu_driver_pcore_axi_lite_module(rtl);

  -- Signals
  SIGNAL top_data_write                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL top_addr_sel                     : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL top_wr_enb                       : std_logic;  -- ufix1
  SIGNAL top_rd_enb                       : std_logic;  -- ufix1
  SIGNAL top_data_read                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL inst_axi_enable                  : std_logic;  -- ufix1
  SIGNAL inst_mcu_reset_in                : std_logic;  -- ufix1
  SIGNAL inst_tr_sw_reg                   : std_logic;  -- ufix1
  SIGNAL inst_pa_en_reg                   : std_logic;  -- ufix1
  SIGNAL inst_tx_en_reg                   : std_logic;  -- ufix1
  SIGNAL inst_rx_en_reg                   : std_logic;  -- ufix1
  SIGNAL inst_latch                       : std_logic;  -- ufix1
  SIGNAL inst_mcu_reg_reset               : std_logic;  -- ufix1
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL top_reset_internal               : std_logic;  -- ufix1

BEGIN
  u_mcu_driver_pcore_addr_decoder_inst : mcu_driver_pcore_addr_decoder
    PORT MAP( clk => AXI_Lite_ACLK,  -- ufix1
              reset => reset,
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              read_init_done_reg => read_init_done_reg,  -- ufix1
              read_latch_done => read_latch_done,  -- ufix1
              read_reg_reset_done => read_reg_reset_done,  -- ufix1
              data_read => top_data_read,  -- ufix32
              write_axi_enable => inst_axi_enable,  -- ufix1
              write_mcu_reset_in => inst_mcu_reset_in,  -- ufix1
              write_tr_sw_reg => inst_tr_sw_reg,  -- ufix1
              write_pa_en_reg => inst_pa_en_reg,  -- ufix1
              write_tx_en_reg => inst_tx_en_reg,  -- ufix1
              write_rx_en_reg => inst_rx_en_reg,  -- ufix1
              write_latch => inst_latch,  -- ufix1
              write_mcu_reg_reset => inst_mcu_reg_reset  -- ufix1
              );

  u_mcu_driver_pcore_axi_lite_module_inst : mcu_driver_pcore_axi_lite_module
    PORT MAP( clk => AXI_Lite_ACLK,  -- ufix1
              AXI_Lite_ARESETN => AXI_Lite_ARESETN,  -- ufix1
              AXI_Lite_AWADDR => AXI_Lite_AWADDR,  -- ufix32
              AXI_Lite_AWVALID => AXI_Lite_AWVALID,  -- ufix1
              AXI_Lite_WDATA => AXI_Lite_WDATA,  -- ufix32
              AXI_Lite_WSTRB => AXI_Lite_WSTRB,  -- ufix4
              AXI_Lite_WVALID => AXI_Lite_WVALID,  -- ufix1
              AXI_Lite_BREADY => AXI_Lite_BREADY,  -- ufix1
              AXI_Lite_ARADDR => AXI_Lite_ARADDR,  -- ufix32
              AXI_Lite_ARVALID => AXI_Lite_ARVALID,  -- ufix1
              AXI_Lite_RREADY => AXI_Lite_RREADY,  -- ufix1
              data_read => top_data_read,  -- ufix32
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              reset_internal => top_reset_internal  -- ufix1
              );

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

  write_axi_enable <= inst_axi_enable;

  write_mcu_reset_in <= inst_mcu_reset_in;

  write_tr_sw_reg <= inst_tr_sw_reg;

  write_pa_en_reg <= inst_pa_en_reg;

  write_tx_en_reg <= inst_tx_en_reg;

  write_rx_en_reg <= inst_rx_en_reg;

  write_latch <= inst_latch;

  write_mcu_reg_reset <= inst_mcu_reg_reset;

  reset_internal <= top_reset_internal;

END rtl;

