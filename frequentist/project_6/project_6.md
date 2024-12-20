# Project 6: NMF

Select a basic, explicit feedback dataset, many examples here:

<https://gist.github.com/entaroadun/1653794>
<https://github.com/caserec/Datasets-for-Recommender-Systems>

<https://github.com/RUCAIBox/RecSysDatasets>

And use the Surprise library:

<http://surpriselib.com/>

To implement a basic recommendation system. Many of those datasets are already loaded into the Surprise package to make this easy. You should tune and cross validate your system to select the best values for the # of latent dimensions, the regularization parameter, and any other hyperparameters.

<!-- Write a python class that, on an explicit feedback dataset, uses the Surprise library to implement a basic recommendation system. Tune and cross validate the system to select the best values for the number of latent dimensions, the regularization parameter and other hyperparameters. -->

Stretch Goal #1 (3 points)

Using an explicit feedback dataset, implement the NMF algorithm by hand, tune it via cross validation to select the # of latent dims and regularization parameter

Stretch goal #2 (3 points)

Using an implicit feedback dataset, some can be found here:

<https://cseweb.ucsd.edu/~jmcauley/datasets.html>

And implement the implicit feedback version of NMF. Evaluating performance will be harder however, so instead of doing a grid search and tuning, try to output the ratings explanations (i.e. use eqn 7 of the implicit feedback dataset).  Nobody has ever attempted this stretch goal.
