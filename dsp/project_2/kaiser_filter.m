function [b, filter_order, num_multiplications] = kaiser_filter(Fp, Fs_stop, Rp, Rs, Fs)
    Wp = Fp / (Fs / 2);
    Ws = Fs_stop / (Fs / 2);
    [filter_order, Wn, beta, ~] = kaiserord([Wp, Ws], [1, 0], [10^(-Rp/20), 10^(-Rs/20)]);
    kaiser_window = kaiser(filter_order + 1, beta);
    b = fir1(filter_order, Wn, kaiser_window);
    num_multiplications = filter_order + 1;
end
