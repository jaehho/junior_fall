function [sos, filter_order, num_multiplications, z, p] = chebyshev1_filter(Fp, Fs_stop, Rp, Rs, Fs)
    Wp = Fp / (Fs / 2);
    Ws = Fs_stop / (Fs / 2);
    [N, Wn] = cheb1ord(Wp, Ws, Rp, Rs);
    [z, p, k] = cheby1(N, Rp, Wn, 'low');
    sos = zp2sos(z, p, k);
    filter_order = 2 * size(sos, 1);
    num_multiplications = 5 * size(sos, 1);
end
