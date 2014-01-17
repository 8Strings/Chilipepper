-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Branch\Chilipepper\Labs\Lab_2\MATLAB\codegen\adc_driver_pcore\hdlsrc\adc_driver_pcore_fixpt.vhd
-- Created: 2013-11-18 13:27:10
-- 
-- Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- rx_i                          ce_out        1
-- rx_q                          ce_out        1
-- blinky                        ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: adc_driver_pcore_fixpt
-- Source Path: adc_driver_pcore_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY adc_driver_pcore_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        rxd                               :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_iq_sel                         :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;
        rx_i                              :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_q                              :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        blinky                            :   OUT   std_logic  -- ufix1
        );
END adc_driver_pcore_fixpt;


ARCHITECTURE rtl OF adc_driver_pcore_fixpt IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL rxd_signed                       : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp                              : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL i_out                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_1                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL q_out_delay                      : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_2                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_3                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL q_out                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_4                            : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL blinky_cnt                       : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL blinky_cnt_1                     : unsigned(24 DOWNTO 0);  -- ufix25
  SIGNAL blinky_1                         : std_logic;  -- ufix1
  SIGNAL p19blinky_mul_temp               : unsigned(38 DOWNTO 0);  -- ufix39_En37
  SIGNAL p19blinky_cast                   : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL blinky_2                         : std_logic;  -- ufix1

BEGIN
  rxd_signed <= signed(rxd);

  enb <= clk_enable;

  i_out_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      i_out <= to_signed(2#000000000000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        i_out <= tmp;
      END IF;
    END IF;
  END PROCESS i_out_reg_process;


  
  tmp <= i_out WHEN rx_iq_sel = '0' ELSE
      rxd_signed;

  rx_i <= std_logic_vector(tmp);

  --HDL code generation from MATLAB function: adc_driver_pcore_fixpt
  tmp_1 <= rxd_signed;

  
  tmp_2 <= tmp_1 WHEN rx_iq_sel = '0' ELSE
      q_out_delay;

  q_out_delay_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      q_out_delay <= to_signed(2#000000000000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        q_out_delay <= tmp_2;
      END IF;
    END IF;
  END PROCESS q_out_delay_reg_process;


  q_out_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      q_out <= to_signed(2#000000000000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        q_out <= tmp_3;
      END IF;
    END IF;
  END PROCESS q_out_reg_process;


  
  tmp_3 <= q_out WHEN rx_iq_sel = '0' ELSE
      q_out_delay;

  rx_q <= std_logic_vector(tmp_3);

  blinky_cnt_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      blinky_cnt <= to_unsigned(2#0000000000000000000000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        blinky_cnt <= tmp_4;
      END IF;
    END IF;
  END PROCESS blinky_cnt_reg_process;


  blinky_cnt_1 <= blinky_cnt + 1;

  
  tmp_4 <= to_unsigned(2#0000000000000000000000000#, 25) WHEN blinky_cnt_1 = 20000000 ELSE
      blinky_cnt_1;

  p19blinky_mul_temp <= tmp_4 * to_unsigned(2#11010110101111#, 14);
  p19blinky_cast <= p19blinky_mul_temp(38 DOWNTO 37);
  blinky_1 <= p19blinky_cast(0);

  blinky_2 <= blinky_1;

  blinky <= blinky_2;

  ce_out <= clk_enable;

END rtl;

