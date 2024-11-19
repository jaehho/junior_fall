# The Cooper Union Department of Electrical Engineering  
**Prof. Fred L. Fontaine**  

### ECE300 Communication Theory  
### Problem Set IV: Analog Communications  

**November 6, 2024**

---

### Problem 1
A nonlinear memoryless device \( v_{\text{out}}(t) = G[v_{\text{in}}(t)] \) can be designed to have an intrinsic antisymmetry, so that the even powers in the Taylor expansion are all 0. Thus, a reasonable small-signal model for the nonlinearity could be:

\[
v_{\text{out}}(t) = a v_{\text{in}}(t) + b v^3_{\text{in}}(t)
\]

for fixed, known constants \(a, b\). In order to generate modulated waveforms with this device, we apply as an input an unmodulated carrier at \(f_0\) summed with a baseband signal \(m(t)\) with bandwidth \(W\) and \(m_0 = \max |m(t)|\):

\[
v_{\text{in}}(t) = m(t) + A_0 \cos(2\pi f_0 t)
\]

We expect that there would be either an AM or a DSB signal that can be extracted from the output signal \(v_{\text{out}}(t)\), with appropriate bandpass filtering to eliminate unwanted terms. This modulated signal would be at a carrier \(f_c = Kf_0\) for either \(K = 1, 2\), or \(3\).

**Note:**  
\[
\cos^3 \theta = \frac{1}{4} \cos(3\theta) + \frac{3}{4} \cos(\theta)
\]

**Tasks:**

1. What is the bandwidth of \( (m(t))^n \) in terms of \(W\)? Hint: What is the spectrum of \( (m(t))^n \) in terms of \(M(f)\), the spectrum of \(m(t)\)?  
2. Expand and simplify \( v_{\text{out}}(t) \) enough so that you can draw a simple sketch of the spectrum, which you will need for the analysis in the rest of the question.  
3. Can we extract an AM signal? If yes, then answer the following:  
   - Specify its carrier frequency.  
   - Specify its modulation index.  
   - What is the widest band for the bandpass filter so that no extraneous terms overlap into the spectrum of the AM signal?  
   - Assuming \(f_0\) is given, is there a tighter constraint on \(W\) beyond \(W < f_0\)?  

4. Repeat all of the above for a DSB-SC signal (except no modulation index to specify).

---

### Problem 2
A 10 GHz carrier is frequency modulated by a sinewave using a frequency sensitivity of 3 MHz/Volt. For each of the following cases, specify:

- Frequency deviation  
- Modulation index  
- Whether the FM signal is narrowband or wideband  
- Approximate bandwidth of the FM signal using Carson’s rule and the universal curve  

Summarize results in a table (you can use MATLAB for computations but show the code).

**Cases:**
1. Amplitude 2 V, frequency 15 MHz  
2. Amplitude 10 V, frequency 10 MHz  
3. Amplitude 2 V, frequency 20 MHz  

---

### Problem 3
Synthesize and sketch several AM signals. Take carrier frequency 10 Hz, carrier amplitude 2 V, \(m(t)\) as a sinewave at frequency 2 Hz with amplitude \(A_m\), and amplitude sensitivity 2 V/V. Use a sampling rate \(f_s = 100\) Hz.  

For the following values of \(A_m\), compute the modulation index (in %), state whether or not the signal is overmodulated, synthesize 2000 samples, and sketch:  
- \(A_m = 0.4\)  
- \(A_m = 0.45\)  
- \(A_m = 0.6\)  

---

### Problem 4
If \(n_I, n_Q\) are iid \(N(0, \sigma^2)\), then the PDF of \(R = |n_I + jn_Q|\) is:

\[
p(r) = \frac{r}{\sigma^2} e^{-\frac{r^2}{2\sigma^2}}, \quad r > 0
\]

**Tasks:**
1. For a threshold \(\rho\), compute \(P(R > \rho)\).  
2. Find the value \(\rho/\sigma^2\) so that \(P(R > \rho) = 10^{-4}\).  
3. Taking \(\sigma^2 = 1\), generate \(10^7\) samples of iid \(n_I + jn_Q\). Compute \(R = |n_I + jn_Q|\), sketch this along with a solid line at \(\rho\).  
4. Find the fraction of time \(R > \rho\) and compare to \(10^{-4}\).  
5. For the same \(\rho\), decrease \(\sigma^2\) by 1 dB and compute theoretical \(P(R > \rho)\). Repeat the simulation.  
6. Repeat for \(\sigma^2\) increased by 1 dB.

---

### Problem 5
An RF signal has bandwidth 200 MHz centered at 20.0 GHz. It is mixed with \(f_{\text{LO}}\) to be brought down to \(f_{\text{IF}} = 600\) MHz.

**Tasks:**
1. Find both possible choices for \(f_{\text{LO}}\).  
2. For each \(f_{\text{LO}}\), determine the nearest image frequency.  
