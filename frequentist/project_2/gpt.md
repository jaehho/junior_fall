# Logistic Regression

Manually implement logistic regression with stochastic gradient descent as the optimization algorithm, with and without L1 or L2 regularization penalty.

Divide the data into roughly 80% train, 10% validation, 10% test; and use the validation dataset to tune any parameters.

- Plot log likelihood
- Plot a scatterplot matrix of the South African heart disease data. Each plot shows a pair of risk factors, and the cases and controls are color coded (red is a case).
- Instead of dropping terms based on Z score, select the optimal model using forward stepwise via cross-validation and report which features are the most important.
- Implement the L1 penalty, and produce a Lasso plot: L1 regularized logistic regression coefficients for the South African heart disease data, plotted as a function of the L1 norm. The variables are all standardized to have unit variance. The profiles are computed exactly at each of the plotted points.
- Use the validation dataset to select the optimal lambda and determine the most important features. Do those features agree with the stepwise feature selection?
- Report the % correct for all 4 models (unregularized, stepwise, L1 and L2 regularized) in a table.

## Extra Goal #2

- Extend the unregularized logistic regression to multinomial regression(i.e. more than binary classification).
  - Find the gradient of the loss function in the multinomial case.
    $$
    \nabla_{\mathbf{w}_j} E(\mathbf{w}_1, \dots, \mathbf{w}_K) = \sum_{n=1}^{N} (y_{nj} - t_{nj}) \boldsymbol{\phi}_n
    $$
- Test on a simple M-ary classification dataset like the Iris dataset from UCI.

  ```python
  from ucimlrepo import fetch_ucirepo 
    
  # fetch dataset 
  iris = fetch_ucirepo(id=53) 
    
  # data (as pandas dataframes) 
  X = iris.data.features 
  y = iris.data.targets 
    
  # metadata 
  print(iris.metadata) 
    
  # variable information 
  print(iris.variables) 
  ```
