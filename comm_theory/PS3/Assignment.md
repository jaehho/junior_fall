Recall the rate-distortion function for a Gaussian source with variance \( \sigma^2 \) (using square error as the distortion) is:

\[
R_g(D) = \begin{cases} 
\frac{1}{2} \log_2 \left( \frac{\sigma^2}{D} \right) & D \leq \sigma^2 \\
0 & D > \sigma^2 
\end{cases}
\]

You will explore the water filling algorithm in this problem. Let \( \vec{X} \) be a real Gaussian vector with \( N \) independent components with respective variances \( \sigma_i^2 \). As you recall in the water filling algorithm, we select a fixed \( \lambda \), and assign distortion to the \( i \)th component \( D_i = \lambda \) if \( \sigma_i^2 > \lambda \), and otherwise \( D_i = \sigma_i^2 \). The corresponding rate will be \( R_i = R_g(\lambda) \) or \( R_i = 0 \), respectively. With total distortion \( D = \sum D_i \), \( R = \sum R_i \), the resulting \( (R, D) \) will be optimal. The problem is we do not know in advance which value of \( \lambda \) will yield a desired value for \( D \) or for \( R \). We basically have to iterate through several choices of \( \lambda \) to try to achieve a desired target value for \( D \) or \( R \).

Here, consider the following situation:

- We have \( \sigma_1^2 = 1 \), \( \sigma_2^2 = 0.8 \), \( \sigma_3^2 = 0.1 \), \( \sigma_4^2 = 0.01 \).
- We want \( R \leq 5 \).

The idea is to iterate over \( \lambda \) so we get \( R \) close to, but not over, 5. The first thing to recognize is that decreasing \( \lambda \) increases \( R \) (for example, if \( \lambda > \max \sigma_i^2 \) then we get \( R = 0 \)!). We want to achieve a condition where \( \lambda_1 \) gives \( R < 5 \) and \( \lambda_2 \) gives \( R > 5 \), then try the midpoint value \( (\lambda_1 + \lambda_2) / 2 \), and iterate. That is, at each step, we have two choices for \( \lambda \) that straddle the target value for \( R \). This is called the bisection method.

Write MATLAB code to implement this algorithm, and run it until we get \( 4.9 < R \leq 5 \). Once you find your final choice for \( \lambda \), specify the \( (R, D) \) point.