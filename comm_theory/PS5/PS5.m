p_negTs = 0.02;
p_0 = -0.04;
p_Ts = 1.0;
p_2Ts = 0.06;
SNR_dB = 15; 

P_signal = p_Ts^2;
P_interference = p_negTs^2 + p_0^2 + p_2Ts^2;
P_noise = P_signal / 10^(SNR_dB / 10);

SIR = 10 * log10(P_signal / P_interference)
SINR = 10 * log10(P_signal / (P_interference + P_noise))