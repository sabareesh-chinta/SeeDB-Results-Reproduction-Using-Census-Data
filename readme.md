# Reproducing partial results from SeeDB: Efficient data-driven visualization recommendations to support visual analytics

We reproduced partial results from the methodology supplied by the authors of [SeeDB][1], where the authors propose a visualization recommendation engine, which can be used as a middle layer on top of any database. Given a subset of data, it allows fast visual analysis. SeeDB explores the space of all possible visualizations for the given dataset and determines the ‘utility’ of a visualization, finally recommending the most promising ones. SeeDB uses sharing optimizations, which allows sharing of resources when querying a database and pruning optimizations, which removes visualizations which have very low utility. We have implemented the proposed algorithms via query rewriting (for shared-based optimizations), using Hoeffding-Serfling inequality for pruning-based optimization and by using K-L Divergence as our utility metric on the [census dataset][2].

## Setup and Execution Instructions

* Go to `Code/preprocessing_csv.ipynb` and run all the cells
* Open terminal, and run the following -
	`brew services start postgresql`
	`psql -U username -d postgres -a -f Code/setup.sql`
* Go to `Code/creating_viz.ipynb` and run all the cells


	[1]: https://dl.acm.org/citation.cfm?id=2831371
	[2]: https://archive.ics.uci.edu/ml/datasets/Census+Income