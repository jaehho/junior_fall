# Sampling Rate Conversion

Design a **sampling rate converter** such that the input signal is **quantized to 8 bits** and **sampled at 11,025 Hz**, and the output is converted to a sampling rate of **24,000 Hz** efficiently. 

- The sampling rate converter must implement both multistage, and polyphase decomposition

You are to write a MATLAB function `srconvert` such that the command `srconvert(in)` takes the input signal `in` with an associated sampling rate of 11,025 Hz, and returns an output signal at a sampling rate of 24,000 Hz.

## MATLAB Utilities

Utilize these functions in your design

- **poly1(h, M)** - returns a matrix `E` whose `i`th row corresponds to the `i`th polyphase components of the FIR filter `h`, obtained via type I decomposition with downsampling factor `M`.

- **upsample(h ,L)** - returns an upsampled version of `h` by a factor `L`, without any interpolation.

- **downsample(h ,M)** - downsamples `h` by `M`.

### File: poly1.m

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