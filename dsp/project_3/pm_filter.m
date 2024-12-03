function [b, filter_order, num_multiplications] = pm_filter(Fp, Fs_stop, Rp, Rs, Fs)
    c = firpmord([Fp Fs_stop], [1 0], [10^(-Rp/20) 10^(-Rs/20)], Fs, 'cell');
    b = firpm(c{:});
    filter_order = c{1};
    num_multiplications = length(b);
end