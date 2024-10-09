# Logistic Regression

Manually implement logistic regression with stochastic gradient descent as the optimization algorithm, with and without the L2 regularization penalty.

Divide the data into roughly 80% train, 10% validation, 10% test; and use the validation dataset to tune any parameters.

- Replicate the analysis of the South African heart disease dataset from the Elements of Statistical Learning textbook and plot figure 4.12: A scatterplot matrix of the South African heart disease data. Each plot shows a pair of risk factors, and the cases and controls are color coded (red is a case). The variable family history of heart disease (`famhist`) is binary (yes or no).
- Report the % correct for all 3 models (unregularized, stepwise, and L2 regularized) in a table.
- Instead of plotting the tables and dropping terms based on Z score, select the optimal model using forward stepwise via cross-validation and report which features are the most important.

## Extra Goal #1

- Implement the L1 penalty as well, and produce a Lasso plot like figure 4.13.
- Include the results in the % correct table.
- Use the validation dataset to select the optimal lambda and determine the most important features. Do those features agree with the stepwise feature selection?

## Extra Goal #2

- Extend the unregularized logistic regression to multinomial regression(i.e. more than binary classification).
  - Find the gradient of the loss function in the multinomial case.
    $$
    \nabla_{\mathbf{w}_j} E(\mathbf{w}_1, \dots, \mathbf{w}_K) = \sum_{n=1}^{N} (y_{nj} - t_{nj}) \boldsymbol{\phi}_n
    $$
- Test on a simple M-ary classification dataset like the Iris dataset from UCI.
