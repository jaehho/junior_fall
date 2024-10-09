# Homework #1

## 1-1

**Fig.1 shows the testbench of a single device.**

(a) Please plot the transconductance as a function of $ V_{DS} $. Let's ignore the channel length modulation. Start $ V_{DS} $ with 1.2V and decrease it down to 0.3V. Assume:

- $ u_nC_{ox} = 500\mu A/V^2 $
- $ W/L = 200 $
- $ V_b = 0.5V $
- $ V_{TH} = 0.2V $

(b) Derive the transconductance of a MOSFET (NMOS) for $ 0 < V_{DS} < 0.3V $ and complete the above graph for $ 0 < V_{DS} < 1.2V $. (It won't be the same gm equation we derived before because we assumed the device was in saturation.)

(c) Back to the condition where $ V_{DS} = 1.2V $ and now consider channel length modulation ($ \lambda = 0.1 $), calculate "intrinsic gain" ($ gm r_o $). Use parameters $ W/L $ and $ u_nC_{ox} $ from part (a).

## 1-2

(a) Build the small-signal model ($g_{m1}$, $g_{m2}$, $r_{o1}$, $r_{o2}$, $v_{gs1}$, and $v_{gs2}$) of circuits below. 
Assume all transistors operate in saturation and $\lambda \neq 0$, $V_{in}$ is small signal but $V_{DD}$ and $V_{b1}$ are DC. 
Both $M_1$ and $M_2$ are NMOS. For Fig. 3, replace $v_{gs1}$ and $v_{gs2}$ in terms of $V_{in}$ and $V_{out}$. 

(b) In addition, find the voltage gain of both circuits. Now, do not use $v_{gs1}$ and $v_{gs2}$ in the equation. Gain should be expressed in terms of $g_{m1}$, $g_{m2}$, $r_{o1}$, and $r_{o2}$. 

## 1-3

The circuit below is one of digital logics (Inverter) where M1 and M2 operate in saturation. The channel-length modulation exists on both devices ($\lambda \neq 0$). 

(a) Convert to small signal model and 

(b) Calculate the small-signal voltage gain of this inverter $ A_v = \frac{v_{out}}{v_{in}} $ using the parameters $ g_{m1}, g_{m2}, r_{o1}, $ and $ r_{o2} $. 

Compare with the gain of Fig. 3 in magnitude and leave a comment about which gain is higher in general. 