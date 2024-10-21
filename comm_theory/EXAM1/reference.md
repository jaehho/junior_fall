# Exam 1 reference sheet

## Equations

### General

- **PAM**
     $$
     \sum_{n=0}^{\infty} s_{i[n]} \left( t - nT \right)
     $$
     $s_{i[n]}$: symbol; $t$: time; $n$: index; $T$: Period

- **Inner Product of signals**
     $$
     \langle f, g \rangle = \int_0^T f(t) g^*(t) \, dt
     $$
     $f, g$: signals; $T$: interval of interest

- **Energy in Signal**
     $$
     \|f\|^2 = \langle f, f \rangle = \mathcal{E}
     $$
     $f$: signal; $\mathcal{E}$: Energy in Signal

### Constellations

- **Bits per Symbol:**
     $$
     k = \log_2 M \\
     M = 2^k
     $$
     $k$: bits per symbol; $M$: number of symbols
- **BER:**
     $$
     \text{BER} \propto d_{\text{min}}^2
     $$
     $\text{BER}$: Bit Error Rate; $d_{\text{min}}$: minimum distance between symbols
- **Energy per symbol**
     $$
     E_s = \frac{1}{M} \sum_{m=1}^{M} \|s_m\|^2
     $$
- **Energy per bit**
     $$
     E_b = \frac{E_s}{k}
     $$
- **SNR per bit**
     $$
     \gamma_b = 10 \log_{10} \left( \frac{E_b}{N_0} \right)
     $$
     $\gamma_b$: SNR per bit; $E_b$: energy per bit; $N_0$: noise power spectral density

- **Symbol Rate**
     $$
     R_s = \frac{1}{T_s}
     $$
     $R_s$: Symbol Rate; $T$: Symbol Period

- **Bit Rate**
     $$
     R_b = k R_s
     $$
     $R_b$: Bit Rate; $k$: bits per symbol

- **Spectral Efficiency**
     $$
     \eta = \frac{R_b}{W} \approx \frac{k}{N}
     $$
     $\eta$: Spectral Efficiency; $R_b$: Bit Rate; $W$: Bandwidth($\sim N$: number of real dimensions); $k$: bits per symbol

### Fourier Transforms

#### Frequency ω (rad/sec)

$$
X(\omega) = \int_{-\infty}^{\infty} x(t) e^{-j\omega t} dt, \quad x(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} X(\omega) e^{j\omega t} d\omega
$$

#### Frequency f (Hz)

$$
X(f) = \int_{-\infty}^{\infty} x(t) e^{-j2\pi ft} dt, \quad x(t) = \int_{-\infty}^{\infty} X(f) e^{j2\pi ft} df
$$

#### Inner Product

$$
\langle x, y \rangle = \int_{-\infty}^{\infty} x(t) y^*(t) dt, \quad \langle X, Y \rangle = \int_{-\infty}^{\infty} X(f) Y^*(f) df
$$

#### Parseval's Theorem

$$
\langle x, y \rangle = \langle X, Y \rangle \\
\|x\|^2 = \langle x, x \rangle \\
\|x\| = \|X\|
$$

#### Finite Energy Signal

$$
\mathcal{E}_x = \int_{-\infty}^{\infty} |x(t)|^2 \, dt = \int_{-\infty}^{\infty} |X(f)|^2 \, df
$$

#### Finite Power Signals

$$
P_x = \lim_{T \to \infty} \frac{1}{T} \int_{-T/2}^{T/2} |x(t)|^2 dt
$$

*For one-sided signals:*

$$
P_x = \frac{1}{T} \int_{0}^{T} |x(t)|^2 \, dt
$$

$$
\mathcal{P}_x \text{ finite } \longrightarrow \mathcal{E}_x = \infty \quad \mathcal{E}_x \text{ finite } \longrightarrow \mathcal{P}_x = 0
$$

#### WSS Signals

$$
\mu = E(x(t)), \quad r_{xx}(\tau) = E(x(t) x^*(t - \tau))
$$

- **Truncated FT**

     $$
     X_T(f) = \int_{-T/2}^{T/2} x(t) e^{-j2\pi ft} dt
     $$

- **PSD**

     $$
     S_x(f) = \lim_{T \to \infty} \frac{1}{T} E\left(|X_T(f)|^2\right)
     $$

#### Convolution

$$
y(t) = (h * x)(t) = \int_{-\infty}^{\infty} h(\tau) x(t - \tau) d\tau \\
V(f) = G(f) * U(f) = \int_{-\infty}^{\infty} G(g) U(f - g) dg
$$

*Time Domain $\leftrightarrow$ Frequency Domain*

$$
h(t) * x(t) \leftrightarrow H(f)X(f) \\
u(t)v(t) \leftrightarrow U(f) * V(f)
$$

#### Special Functions

- **Sinc function:**
     $$
     \text{sinc}(u) = \frac{\sin(\pi u)}{\pi u}
     $$
  
- **Rectangular Pulse:**
     $$
     \Pi(u) = 1_{[-1/2, 1/2]}
     $$

- **Triangular Pulse:**
     $$
     \Lambda(u) = (1 - |u|) \cdot 1_{[-1, 1]}
     $$

- **Triangular and Rectangular Pulse:**
     $$
     T\Lambda(t/T) = \Pi(t/T) * \Pi(t/T)
     $$

- **Fourier Transforms**
     $$
     \Pi(t/T) \leftrightarrow T \text{sinc}(fT) \\
     \Lambda(t/T) \leftrightarrow T \text{sinc}^2(fT)
     $$

     $$
     \text{sinc}(t/T) \leftrightarrow T\Pi(fT) \\\
     \text{sinc}^2(t/T) \leftrightarrow T\Lambda(fT)
     $$

#### Gaussian Pulse

$$
g_{\mu, \sigma}(u) = \frac{1}{\sqrt{2\pi}\sigma} \exp\left(-\frac{(u - \mu)^2}{2\sigma^2}\right)
$$

$$
g_{\mu, \sigma}(t) \leftrightarrow \exp\left(-j2\pi \mu f - (2\pi)^2 \frac{\sigma^2}{2} f^2\right)
$$

- **Properties:**
     $$
     \int_{-\infty}^{\infty} g_{\mu, \sigma}(u) \, du = 1 \\
     \int_{-\infty}^{\infty} u g_{\mu, \sigma}(u) \, du = \mu \\
     \int_{-\infty}^{\infty} (u - \mu)^2 g_{\mu, \sigma}(u) \, du = \sigma^2
     $$

- **Convolution:**
     $$
     g_{\mu_1, \sigma_1} * g_{\mu_2, \sigma_2} = g_{\mu, \sigma}
     $$
     $$
     \mu = \mu_1 + \mu_2, \quad \sigma = \sqrt{\sigma_1^2 + \sigma_2^2}
     $$

#### Shifting Properties

- **Time shift:**
  $$
  x(t - t_0) \leftrightarrow e^{-j2\pi f t_0} X(f)
  $$
  
- **Frequency shift:**
  $$
  e^{j2\pi f_0 t} x(t) \leftrightarrow X(f - f_0)
  $$

#### Impulse Functions

$$
e^{j 2 \pi f_0 t} \quad \leftrightarrow \quad \delta(f - f_0)
$$
$$
\cos(2 \pi f_0 t) \quad \leftrightarrow \quad \frac{1}{2} \delta(f - f_0) + \frac{1}{2} \delta(f + f_0)
$$
$$
\sin(2 \pi f_0 t) \quad \leftrightarrow \quad \frac{1}{2j} \delta(f - f_0) - \frac{1}{2j} \delta(f + f_0)
$$

#### Important Identity

$$
cos(A)cos(B) = \frac{1}{2}cos(A+B) + \frac{1}{2}cos(A-B)
$$

#### Symmetries of the Fourier Transform

$$
x^*(t) \leftrightarrow X^*(-f)
$$
$$
x^*(-t) \leftrightarrow X^*(f)
$$

1. **Zero-Phase**: $X(f)$ is purely real iff $x(t) = x^*(-t)$.
2. **Linear-Phase**: $\angle X(f)$ is linear if $x$ has a point of symmetry in time:
   $$
   X(f) = e^{-j \pi f T} X_R(f) \leftrightarrow x(t) = x^*(T - t)
   $$

3. $x(t)$ is real iff $X(f)$ is conjugate symmetric: $X(f) = X^*(-f)$:
   - $\text{Re} X(f)$ and $|X(f)|$ are even functions of $f$.
   - $\text{Im} X(f)$ and $\angle X(f)$ are odd functions of $f$.

4. $x(t)$ is purely imaginary iff $X(f) = -X^*(-f)$.

#### Correlation

- **Time-reversed Complex Conjugate**
     $$
     \tilde{x}(t) = x^*(-t) \\
     \tilde{x}(t) \leftrightarrow X^*(f)
     $$

- **Deterministic Auto-Correlation**
     $$
     r_{xx}(\tau) = \int_{-\infty}^{\infty} x(t + \tau) x^*(t) \, dt \\
     r_{xx} \leftrightarrow |X(f)|^2
     $$

- **Deterministic Cross-Correlation**
     $$
     r_{xy}(t) = \int_{-\infty}^{\infty} x(t + \tau) y^*(t) \, dt
     $$
     $$
     r_{xy} = x * \tilde{y}
     $$

#### Finite Power Spectrum

$$
r_{xx}(\tau) = \lim_{T \to \infty} \frac{1}{T} \int_{-T/2}^{T/2} x(t + \tau) x^*(t) \, dt
$$

- **Deterministic power spectral density** (*power spectrum*):
     $$
     S_x(f) = \lim_{T \to \infty} \frac{1}{T} |X_T(f)|^2
     $$
     = PSD for WSS signals

- **$x$ is filtered by $H$ to produce $y$** ($y = h * x$)
     $$
     r_{yy} = h \ast \tilde{h} \ast x
     $$
     $$
     S_y(f) = |H(f)|^2 S_x(f)
     $$

- **Inner Product ~ correlation ~ convolution**
     $$
     \langle x, \phi \rangle = \int_{-\infty}^{\infty} x(t) \phi^*(t) \, dt \\
     = r_{x\phi}(0) \\
     = \tilde{\phi} * x \Big|_{t=0}
     $$

- **Matched Filter**
     $$
     \psi(t) = \tilde{\phi}(t - T) \\
     \langle x, \phi \rangle = \psi * x \Big|_{t=T}
     $$
     $$
     \Psi(f) = e^{-j2\pi f T} \Phi^*(f)
     $$

### Baseband

#### Phasors

- **Phasor**
     $$
     x(t) = A \cos(2\pi f_c t + \theta) = i \cos 2\pi f_c t - q \sin 2\pi f_c t \\
     i = A \cos \theta, \quad q = A \sin \theta
     $$
     $$
     X = A e^{j\theta} = i + jq \\
     x(t) = \text{Re}\left[X e^{j 2\pi f_c t} \right]
     $$
- **Differentiator:**
     $$
     Y = j2\pi f_c X
     $$
- **Integrator:**
     $$
     Y = \frac{1}{j2\pi f_c} X
     $$

#### Baseband Equivalent

$$
x(t) = \text{Re}\left[x_{BB}(t) e^{j 2\pi f_c t} \right]
$$
$$
x_{BB}(t) = A(t) e^{j\theta(t)}=i(t) + jq(t) \\
x(t) = A(t) \cos(2\pi f_c t + \theta(t)) = i(t) \cos 2\pi f_c t - q(t) \sin 2\pi f_c t
$$

#### Spectra

$$
X(f) = \frac{1}{2} X_{BB}(f - f_c) + \frac{1}{2} X_{BB}^*(-f - f_c)
$$

#### Spectral Interpretation

$$
x(t) = \frac{1}{2} X e^{j2\pi f_c t} + \frac{1}{2} X^* e^{-j2\pi f_c t}
$$
$$
X(f) = \frac{1}{2} X \delta(f - f_c) + \frac{1}{2} X^* \delta(f + f_c)
$$

#### Systems

$$
h(t) = 2 \text{Re} \left[ h_{BB}(t) e^{j2\pi f_c t} \right]
$$
$$
y_{BB} = h_{BB} * x_{BB}
$$
$$
Y_{BB}(f) = H_{BB}(f) X_{BB}(f)
$$

### Hilbert Transform

$$
H_{\text{Hilb}}(f) = -j \, \text{sign}(f) =
\begin{cases}
-j & f > 0 \\
j & f < 0
\end{cases}
$$

$$
h_{\text{Hilbert}}(t) = \frac{1}{\pi t}
$$

$$
x^{(H)}(t) = \frac{1}{\pi} \int_{-\infty}^{\infty} \frac{x(\tau)}{t - \tau} \, d\tau
$$

- **Upper and Lower Sidebands**
     $$
     x_U(t) = x(t) + jx^{(H)}(t)
     $$
     $$
     x_L(t) = x(t) - jx^{(H)}(t)
     $$

- **USSB and LSSB**

$$
x_{BB}^{(USSB)}(t) = x_{BB}(t) + jx_{BB}^{(H)}(t)
$$
$$
x_{BB}^{(LSSB)}(t) = x_{BB}(t) - jx_{BB}^{(H)}(t)
$$
$$
X_{BB}^{(USSB)}(f) = 2X_{BB}(f) \mathbf{1}_{\{f<0\}}
$$
$$
X_{BB}^{(LSSB)}(f) = 2X_{BB}(f) \mathbf{1}_{\{f<0\}}
$$

#### Discrete Hilbert Transform

$$
H_{DHT}(\omega) =
\begin{cases}
  -j & 0 < \omega < \pi \\
  j & -\pi < \omega < 0
\end{cases}
$$
$$
h_{DHT}[n] = \frac{2}{\pi n} 1_{\{n \text{ odd}\}}
$$

### Hermitian Transpose

$$
A^H = \text{Hermitian transpose} = \text{conjugate transpose of } A
$$

- **Hermitian Matrix**
     $$
     A = A^H
     $$

### Inner Product for Vectors

$$
\langle u, v \rangle = v^H u = \sum_{i=1}^{n} u_i v^*_i
$$

### Outer Product for Vectors

$$
uv^H = \text{matrix with ijth component } u_i v^*_j
$$

### Properties of Hermitian Matrices

- A matrix $A$ is Hermitian if $A = A^H$.
- For any vector $a$, $a^H A a$ is a real scalar.
- All eigenvalues of a Hermitian matrix are real.
- There exists an orthonormal set of eigenvectors that span the space.

### Positive Semidefinite and Definite

- A Hermitian matrix $A$ is **positive semidefinite** if $a^H A a \geq 0$ for all vectors $a$. This occurs iff all eigenvalues of $A \geq 0$.
- A Hermitian matrix $A$ is **positive definite** if $a^H A a > 0$ for all $a \neq 0$. This occurs iff all eigenvalues of $A > 0$.

## Decision Theory

### Decision Rule

- **Decision Rule**: An algorithm to make decisions by partitioning decision space D into regions $\{Λ_m\}^M_{m=1}$. Select $H_m$ if $\mathbf{r} \in Λ_m$.

### Probability Model

- **Likelihood Function**: $P(\mathbf{r} | \mathbf{s}_m)$
- **Prior Model**: $\pi_m = P(\mathbf{s}_m)$
- **Posterior Distribution**: $P(\mathbf{s}_m | \mathbf{r})$ calculated as:
  $$
  P(\mathbf{s}_m | \mathbf{r}) = \frac{P(\mathbf{r} | \mathbf{s}_m) \pi_m}{\sum_{k=1}^M P(\mathbf{r} | \mathbf{s}_k)\pi_k}
  $$

### Decision Rules

- **MAP (Maximum A-Posteriori)**: Chooses the hypothesis with the maximum posterior probability.
  $$
  \hat{m}_{MAP} = \text{arg max}_m \, P(\mathbf{s}_m | \mathbf{r})
  $$
- **ML (Maximum Likelihood)**: Maximizes the likelihood function.
  $$
  \hat{m}_{ML} = \text{arg max}_m \, P(\mathbf{r} | \mathbf{s}_m)
  $$
- **LS (Least-Squares)**: Minimizes the Euclidean distance between the received signal and the transmitted symbol.
  $$
  \hat{m}_{LS} = \text{arg min}_m \, \|\mathbf{r} - \mathbf{s}_m\|
  $$

### MAP vs ML

- **MAP** incorporates prior probabilities and is optimal in minimizing the probability of error.
- **ML** ignores prior probabilities and is optimal when hypotheses are equally probable.
- If all hypotheses are equally probable, MAP and ML are equivalent.

### Communication Channels

- **Binary Symmetric Channel (BSC)**: A binary vector is transmitted, and errors are symmetric with probability $p$.
  - **ML decision** minimizes the Hamming distance between the received and transmitted vectors:
    $$
    \hat{m}_{ML} = \text{arg min}_m \, d_{\text{Ham}}(\mathbf{r}, \mathbf{s}_m)
    $$
- **AWGN Channel**: The received signal is modeled as:
  $$
  \mathbf{r} = \mathbf{s}_m + \mathbf{n}
  $$
  where $\mathbf{n}$ is Gaussian noise. The likelihood function is:
  $$
  P(\mathbf{r} | \mathbf{s}_m) \propto \exp\left( -\frac{1}{2\sigma^2} \|\mathbf{r} - \mathbf{s}_m\|^2 \right)
  $$
  - **ML decision** minimizes the Euclidean distance.

### Matched Filter

- **Correlation Receiver**: The matched filter compares the received signal with the transmitted signal using:
  $$
  \langle \mathbf{r}, \mathbf{s}_m \rangle = \int r(t) s_m^*(t) \, dt
  $$
  - **MF Decision Rule**: Select the hypothesis that maximizes the real part of the correlation:
    $$
    \hat{m} = \text{arg max}_m \, \text{Re} \langle \mathbf{r}, \mathbf{s}_m \rangle
    $$

### Optimum Decision Rule for AWGN

- **MAP for AWGN** can be implemented as a matched filter with bias terms to account for different symbol probabilities and energies:
  $$
  \hat{m}_{MAP} = \text{arg max}_m \, \left[ \text{Re} \langle \mathbf{r}, \mathbf{s}_m \rangle + b_m \right]
  $$
  where $b_m$ is a bias term.

### Summary

- **MAP Decision Rule** minimizes the probability of error.
- **MAP** = **ML** for equiprobable symbols
- **ML** = **LS** for AWGN channels
- **LS** = **MF**, for equal energy symbols

## Acronyms/Abbreviations

**Short** | **Long**  
---       | ---  
ML        | Maximum Likelihood  
MAP       | Maximum A-Posteriori  
SNR       | Signal to Noise Ratio  
BER       | Bit Error Rate  
PSK       | Phase Shift Keying  
FSK       | Frequency Shift Keying  
QPSK      | Quadrature Phase Shift Keying  
QAM       | Quadrature Amplitude Modulation  
LPI       | Low Probability of Intercept  
LPD       | Low Probability of Detect  
LOS       | Line of Sight  
NLOS      | Non-Line of Sight  
ISI       | Intersymbol Interference  
PAM       | Pulse Amplitude Modulation  
USB       | Upper Sideband  
LSB       | Lower Sideband  
USSB      | Upper Single Sideband  
LSSB      | Lower Single Sideband  
DSB       | Double Sideband  
QOS       | Quality of Service  
AWGN      | Additive White Gaussian Noise  
PSD       | Power Spectral Density  
LS        | Least Square  
WSS       | Wide Sense Stationary  
BSC       | Binary Symmetric Channel  
MF        | Matched Filter  
