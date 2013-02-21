%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% QPSK demonstration packet-based transceiver for Chilipepper
% Toyon Research Corp.
% http://www.toyon.com/chilipepper.php
% Created 10/17/2012
% embedded@toyon.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file is the top level entry function for the receiver portion of the
% example. The entire receiver is designed to run at Rate=1 (one clock
% cycle per iteration of the core. 
% We follow standard receive practice with frequency offset estimation,
% pulse-shape filtering, time estimateion, and correlation to determine
% tart of packet.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%#codegen
function [byte_out, en_out, clear_fifo_out, num_bytes_ready_out, ...
        r_out, s_f_out, s_c_out, s_t_out, t_est_out, s_p_out, s_o_out, ...
        fe_out, phi] = ...
    qpsk_rx(i_in, q_in, mu_foc_in, mu_toc_in, mcu_rx_ready_in)

persistent finish_rx_latch

if isempty(finish_rx_latch)
    finish_rx_latch = 0; % feedback once packet is received to rest
end

% scale input data coming from the Chilipepper ADC to be purely fractional
% to avoid scaling issues
r_in = complex(i_in, q_in);

% frequency offset estimation. Note that time constant is input as integer
[s_f_i, s_f_q, fe, phi] = ...
    qpsk_rx_foc(i_in, q_in, mu_foc_in, finish_rx_latch);

% Square-root raised-cosine band-limited filtering
[s_c_i, s_c_q] = qpsk_rx_srrc(s_f_i, s_f_q);

% Time offset estimation. Output data changes at the symbol rate.
[s_t_i, s_t_q, tauh] = ...
    qpsk_rx_toc(s_c_i, s_c_q, mu_toc_in, finish_rx_latch);

% Determine start of packet using front-loaded training sequence
[byte, en, finish_rx, clear_fifo, num_bytes_ready_out, s_p, s_o] = ...
    qpsk_rx_correlator(s_t_i, s_t_q, mcu_rx_ready_in);

% These are debug outputs and can largely be ignored as they are just used
% for testbench simulation
byte_out = byte;
en_out = en;
clear_fifo_out = clear_fifo;

finish_rx_latch = finish_rx;

r_out = real(r_in);
s_f_out = complex(s_f_i,s_f_q);
s_c_out = complex(s_c_i,s_c_q);
s_t_out = complex(s_t_i,s_t_q);

t_est_out = tauh;
s_p_out = s_p;
s_o_out = s_o;
fe_out = fe;