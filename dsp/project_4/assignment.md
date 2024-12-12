# Spectrogram Analysis and Applications

## Frequency-Modulated Signals

Spectrograms display frequency variations as a function of time. In this section, we will attempt to develop some intuition about the STFT by analyzing signals with known frequency variations, specifically linear frequency modulated (FM) chirp signals. The mathematical form of a continuous-time linear FM chirp is:

$$
x(t) = \cos ( 2\pi \mu t^2 )
$$

1. Generate a discrete-time linear FM chirp signal $x[n]$ using a sampling frequency of 5 MHz and letting the chirp rate be $\mu = 4.0 \times 10^9$. Assume that the continuous-time chirp lasts 200 $\mu$s. Generate a spectrogram for this signal $X_n(\omega)$ using 256-point FFTs, a 256-point triangular window, and an overlap of 255 samples between sections. (The MATLAB function `triang` can be used to construct the triangular window.)

2. Notice the distinct ridge in the time-frequency plot of part (1). Let us attempt to relate this to the functional form of the linear FM chirp signal. If the frequency modulation of $x[n]$ is rewritten as $x(t) = \cos[2\pi f_1(t)t]$, one could interpret $f_1(t)$ as the "instantaneous frequency" of $x(t)$. Another way to construct an "instantaneous frequency" of $x(t)$ is the time derivative of the phase: $f_2(t) = \frac{1}{2\pi} \frac{d}{dt}[\phi(t)] \quad \text{where } x(t) = \cos[\phi(t)]$. Calculate both of these definitions of "instantaneous frequency" for the signal in part (1) and determine which definition corresponds to the slope of the ridge in the spectrogram.

3. Sketch the spectrogram if the chirp rate was changed to $\mu = 1.0 \times 10^{10}$. Verify your intuition by defining another chirp signal $x_2[n]$ with this chirp rate and computing its spectrogram. Compare this spectrogram to the one obtained in part (1) and discuss your conclusions.

## Narrowband and Wideband Spectrograms

The window used to compute the STFT determines the frequency resolution of the analysis. In this section, you will examine the effect of the window on the spectrogram of a voiced speech signal. You will need two speech files in the project zip file: `s1.mat` and `s5.mat`. Load in these files by typing:`load s1` and `load s5`at the MATLAB prompt. Assume these speech signals are sampled at 8 kHz. If you wish to listen to these files, the MATLAB function `soundsc` can be used to autoscale and play signals.

The exercises below depend on the frequency structure of human speech. Voiced human speech is produced by buzzing from the vocal cords (glottal excitation) into the resonant frequencies (formants) of the vocal tract. At high frequency resolution, we can see the individual harmonics of the glottal excitation signal at multiples of its pitch frequency. At low frequency resolution, the individual harmonics are blurred, but the emphasis applied by the vocal tract resonances is more obvious in the wide peaks. As the lips, teeth and tongue change the shape of the vocal tract, the resonant frequencies (formants) change the sound to correspond to various recognizable vowel sounds. Thus, the specific formant frequencies determine the vowel sound perceived by the listener.

1. One application of a spectrogram is to estimate the fundamental frequency as a function of time. This estimation can be performed using a narrowband spectrogram which has fine frequency resolution and poor temporal resolution. Determine the proper spectrogram parameters (FFT length, window length and overlap between sections) to construct narrowband spectrograms of `s1.mat` and `s5.mat`. Use a triangular window and FFT lengths that are powers of two. Experiment with different parameter values to obtain spectrograms that enable you to estimate and sketch the fundamental frequency of both speech signals as a function of time.

2. Another application of a spectrogram is to estimate the formant frequencies as a function of time. This estimate can be performed using a wideband spectrogram which has fine temporal resolution and poor frequency resolution. Determine the proper spectrogram parameters (FFT length, window length and overlap between sections) to construct wideband spectrograms of `s1.mat` and `s5.mat`. Use a triangular window and FFT lengths that are powers of two. Experiment with different parameter values to obtain spectrograms that enable you to estimate and sketch the formant frequencies of both speech signals as a function of time.

## Changing the Rate of Speech

There are many scenarios where changing the rate of speech may be useful. One example is slowing down speech for beginners trying to learn a new language. Simple schemes that temporally interpolate or decimate the speech signal will change the speech rate but also alter characteristics of the speech such as the fundamental frequency and formant frequencies. The altered speech characteristics can make the speech signal unintelligible. Ideally, one would like to be able to modify the rate of speech while preserving the speech characteristics. The STFT can be used to accomplish this. In this section, you will modify a STFT and then use the function that you wrote in the previous section to obtain a speech signal with a different time scale than the original signal, but with the frequency characteristics of the speech preserved.

First, load in the speech signal from `vowels.mat` and compute the spectrogram using a 256-point rectangular window with an overlap of 128 points per section, 1024-point FFTs, and assuming a sampling rate of 8 kHz. Then compress the time scale by a factor of 2 by throwing out every other slice in time, and use the function from the previous section to obtain a faster speech signal with the same frequency content. Plot the speech signal before and after time scale modification. Listen to the signals to verify that your processing is working correctly.
