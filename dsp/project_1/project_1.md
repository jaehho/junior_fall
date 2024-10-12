# Sampling Rate Conversion

Design a **sampling rate converter** such that the input signal is **quantized to 8 bits** and **sampled at 11,025 Hz**, and the output is converted to a sampling rate of **24,000 Hz** efficiently. Use multistage, and polyphase interpolation to maximize efficiency of the sampling rate converter.

- The system performs sampling rate conversion from **11,025 Hz** to **24,000 Hz**.
- The Fourier transform of the output approximates an ideal lowpass filter, meeting the following specifications:

| Parameter                       | Value                                   |
|---------------------------------|-----------------------------------------|
| Passband Cutoff ($\omega_p$)    | $\frac{11,025}{24,000} \pi$             |
| Passband Ripple                 | ±0.1 dB or less                         |
| Stopband Frequency ($\omega_s$) | 1.2 $\omega_p$                          |
| Stopband Attenuation            | 70 dB or more                           |
| Phase Constraints               | $\lvert \text{max grpdelay} - \text{min grpdelay} \rvert \leq 720$ in the passband |

You are to write a MATLAB function `srconvert` such that the command `srconvert(in)` takes the input signal `in` with an associated sampling rate of 11,025 Hz, and returns an output signal at a sampling rate of 24,000 Hz. Once your function `srconvert.m` is finalized, run the command `y = srconvert([1 zeros(1,3000)]);`. This will produce a vector `y` which contains the response of your system to a unit impulse. Then call `verify(y)` to verify that your design meets the design specification.

## MATLAB Utilities

Utilize these functions in your design

- **examlpf(h, wp, vs)** - allows you to examine the passband ripple, the group delay, as well as the stopband attenuation of the lowpass filter whose impulse response is `h`. It generates three simultaneous plots. The first one zooms in on the passband with cutoff frequency `wp`. The second plot measures the group delay in the passband, and the third plot is simply the magnitude response over the entire frequency range (-π,π). The passband (`wp`) and stopband (`ws`) cutoff frequencies are normalized by π/2. That is, a cutoff frequency at π/2 should be entered as `0.5`.

- **poly1(h, M)** - returns a matrix `E` whose `i`th row corresponds to the `i`th polyphase components of the FIR filter `h`, obtained via type I decomposition with downsampling factor `M`.

- **fftfilt(h , x)** - convolves the signal `x` with the filter `h` using the FFTs. Beware that this command might not always lead to a more efficient implementation than `conv(h , x)`, depending on the length of the signals.

- **upsample(h ,L)** - returns an upsampled version of `h` by a factor `L`, without any interpolation.

- **downsample(h ,M)** - downsamples `h` by `M`.

## File: db20.m

```matlab
function y=db20(x)

y=20*log10(abs(x));
return;
```

## File: examlpf.m

```matlab
function [maxripple,gdvariation,atten]=examlpf(h,wp,ws)

% function [R,G,A]=examlpf(h,wp,ws)
%
% Plots the DFT of the lowpass filter whose impulse response is h.
% The arguments wp, and ws denotes the passband and stopband cutoff 
% frequency normalized by pi.
% Plot 1: zooms in the passband and measures the ripple size (R).
% Plot 2: shows group delay in the passband, measuring the difference 
%         between the max-min in grd (G)
% Plot 3: shows the entire magnitude frequency response, and measures
%         the stopband attenuation (A).
% 


fftlength = 1024*8;
ffth = db20(fft(h,fftlength));

ind = round(wp*fftlength/2);

meandb = mean(ffth(1:ind));

subplot(3,1,1)
plot((1:ind)/fftlength*2,ffth(1:ind));
maxripple = max(abs(ffth(1:ind))-meandb);
title(['Passband Response,  Ripple = ' num2str(maxripple) ' dB']);
xlabel('\omega / \pi')
ylabel('dB')

subplot(3,1,2)
[gd,w]  = grpdelay(h,1,fftlength/2);
maxgd  = max(gd(1:ind));
mingd  = min(gd(1:ind));
gdvariation = abs(maxgd-mingd);
plot(w(1:ind)/pi,gd(1:ind));
title(['Group Delay in Passband, max-min = ' num2str(gdvariation)])
xlabel('\omega / \pi');
ylabel('Samples');

subplot(3,1,3)

atten  = max(ffth(round(ws*fftlength/2):fftlength/2)-meandb);
plot((1:fftlength)/fftlength*2,ffth)
title(['Overall Response , Attenuation = ' num2str(atten) ' dB']);
xlabel('\omega / \pi');
ylabel('dB')

return
```

## File: poly1.m

```matlab
function E=poly1(h,M)
%
% Performs type I polyphase decomposition of h in M components.
% The ith row of E corresponds to the ith polyphase component.
% Assumes that the first point of h is index 0.
%
h = [h zeros(1, ceil(length(h)/M)*M-length(h))];
E = reshape(h, M, length(h)/M);
```

## File: verify.m

```matlab
function yes = verify(h)
%
% Verifies that h meets all the specifications given in the
% handout. Returns a 1 if all specifications are met.


[R,G,A]=examlpf(h,147/320,147/320*1.2);


% passband magnitude

yes  = R <=0.1;
subplot(3,1,1)

if R <=0.1
 title(['Passband Response,  Ripple = ' num2str(R) ' dB, OK']);
else
 title(['Passband Response,  Ripple = ' num2str(R) ' dB, too big']);
end

% Group delay
subplot(3,1,2)
if G <= 720
 title(['Group Delay in Passband, max-min = ' num2str(G) ', OK'])
else
 title(['Group Delay in Passband, max-min = ' num2str(G) ', too big'])
end
yes  = yes*(G <= 720);

% Stopband magnitude

subplot(3,1,3)
if A <=-70
 title(['Overall Response , Attenuation = ' num2str(A) ' dB, OK']);
else
 title(['Overall Response , Attenuation = ' num2str(A) ' dB, too small']);
end

yes  = yes * (A <= -70);


sprintf('Passband Ripple:       %5.3f dB \n',R)
sprintf('Groupdelay Variation:  %5d   samples \n',G)
sprintf('Stopband Attenuation:  %5.3f dB \n',A)


return
```
