-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_3\MATLAB\codegen\qpsk_tx\hdlsrc\qpsk_tx_pcore_dut.vhd
-- Created: 2014-01-10 10:38:39
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_tx_pcore_dut
-- Source Path: qpsk_tx_pcore/qpsk_tx_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY qpsk_tx_pcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        empty_in                          :   IN    std_logic;  -- ufix1
        clear_fifo_in                     :   IN    std_logic;  -- ufix1
        tx_en_in                          :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        i_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        q_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        tx_done_out                       :   OUT   std_logic;  -- ufix1
        request_byte                      :   OUT   std_logic;  -- ufix1
        blinky                            :   OUT   std_logic  -- ufix1
        );
END qpsk_tx_pcore_dut;


ARCHITECTURE rtl OF qpsk_tx_pcore_dut IS

  -- Component Declarations
  COMPONENT qpsk_tx_fixpt
    PORT( clk                             :   IN    std_logic;
          ce                              :   IN    std_logic;
          reset                           :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          empty_in                        :   IN    std_logic;  -- ufix1
          clear_fifo_in                   :   IN    std_logic;  -- ufix1
          tx_en_in                        :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          i_out                           :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          q_out                           :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          tx_done_out                     :   OUT   std_logic;  -- ufix1
          request_byte                    :   OUT   std_logic;  -- ufix1
          blinky                          :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : qpsk_tx_fixpt
    USE ENTITY work.qpsk_tx_fixpt(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL empty_in_sig                     : std_logic;  -- ufix1
  SIGNAL clear_fifo_in_sig                : std_logic;  -- ufix1
  SIGNAL tx_en_in_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL i_out_sig                        : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL q_out_sig                        : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL tx_done_out_sig                  : std_logic;  -- ufix1
  SIGNAL request_byte_sig                 : std_logic;  -- ufix1
  SIGNAL blinky_sig                       : std_logic;  -- ufix1

BEGIN
  u_qpsk_tx_fixpt : qpsk_tx_fixpt
    PORT MAP( clk => clk,
              ce => enb,
              reset => reset,
              data_in => data_in,  -- ufix8
              empty_in => empty_in_sig,  -- ufix1
              clear_fifo_in => clear_fifo_in_sig,  -- ufix1
              tx_en_in => tx_en_in_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              i_out => i_out_sig,  -- sfix12
              q_out => q_out_sig,  -- sfix12
              tx_done_out => tx_done_out_sig,  -- ufix1
              request_byte => request_byte_sig,  -- ufix1
              blinky => blinky_sig  -- ufix1
              );

  empty_in_sig <= empty_in;

  clear_fifo_in_sig <= clear_fifo_in;

  tx_en_in_sig <= tx_en_in;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  i_out <= i_out_sig;

  q_out <= q_out_sig;

  tx_done_out <= tx_done_out_sig;

  request_byte <= request_byte_sig;

  blinky <= blinky_sig;

END rtl;

