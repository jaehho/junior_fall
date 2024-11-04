# Project 2: Digital Filter Design

## Task

In matlab, design a SOS cascaded DT filter using `butter`, `zp2sos`, and `sosfilt`.

## Filter Specifications

1. Passband edge: 2500 Hz.
2. Stopband edge: 4000 Hz.
3. Maximum gain in the passband : 40 dB.
4. Minimum gain in the passband : 37 dB.
5. Maximum gain in the stopband : -55 dB.

## Input signal

- Sampled at 44100 (fs) Hz
- Consists of a summation of a speech signal which was band-limited at 4 kHz using a low-pass filter with a very narrow transition band, and a noise signal which was filtered at 4 kHz using a high-pass filter with a very narrow transition band

### Analysis

1. Determine the order of the overall filter.
2. Determine the number of multiplication operations per input sample required to implement the filter. Be sure to consider the structure you assume.
3. Plot the magnitude response (in dB) from $w=0$ to $w=\pi$ using `freqz`. Plot a detail of the magnitude response, focusing on the passband ripple (linear scale). Plot the group delay (in samples) using `grpdelay`. (Use `subplot` to fit the three plots on the same page for each filter.)
4. Plot the pole-zero diagram.
5. Plot the impulse response using `filter` and `stem` for 100 samples. (Use `subplot` to fit the pole-zero diagram and the impulse response on the same page.)
