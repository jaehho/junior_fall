function [sos, filter_order, num_multiplications, z, p] = chebyshev2_filter(Fp, Fs_stop, Rp, Rs, Fs)
    Wp = Fp / (Fs / 2);
    Ws = Fs_stop / (Fs / 2);
    [N, Wn] = cheb2ord(Wp, Ws, Rp, Rs);
    [z, p, k] = cheby2(N, Rs, Wn, 'low');
    sos = zp2sos(z, p, k);
    filter_order = 2 * size(sos, 1);
    num_multiplications = 5 * size(sos, 1);
end
