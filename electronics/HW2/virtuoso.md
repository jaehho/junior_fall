# Homework 2 Virtuoso Questions

## 2.4

fig.(a) widths and lengths
![24awl](24awl.png)

fig.(a) operating points
![24aop](24aop.png)

fig.(a) simulation results
![24asim](24asim.png)

fig.(b) widths and lengths
![24bwl](24bwl.png)

fig.(b) operating points
![24bop](24bop.png)

fig.(b) simulation results
![24bsim](24bsim.png)

$I_{out}$ varies less in fig.(b) because the output impendance is higher than fig.(a). Higher output impedance means that the output current is less affected by the output voltage. As an ideal current source has infinite output impedance, the structure in fig.(b) is closer to an ideal current source.

## 2.5

fig.(a) widths and lengths
![25awl](25awl.png)

fig.(a) operating points
![25aop](25aop.png)

fig.(a) simulation results
![25asim](25asim.png)

## Bonus

fig.(b) widths and lengths
![bonuswl](bonuswl.png)

fig.(b) operating points
![bonusop](bonusop.png)

fig.(b) simulation results
![bonussim](bonussim.png)

I increased the output impedance by increasing the lengths of the M5 and M6 transistors. The lengths of the transistors are inversely proportional to the drain current, which is inversely proportional to the output impedance. Thus the lengths of the transistors are directly proportional to the output impedance. The higher output impedance means that the output current is less affected by the output voltage.

$$
r_{o} = \frac{1}{\lambda I_{D}}, \quad I_{D} = \frac{1}{2}u_nC_{ox}\frac{W}{L}(V_{GS} - V_{TH})^2
$$

$$
r_{o} = \frac{1}{\lambda \frac{1}{2}u_nC_{ox}\frac{W}{L}(V_{GS} - V_{TH})}, \quad r_{o} \propto \frac{L}{W}
$$
