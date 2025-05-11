Owl Search Algorithm (OSA) in MATLAB
This repository provides a complete MATLAB implementation of the Owl Search Algorithm (OSA) — a population-based metaheuristic optimization algorithm inspired by the intelligent hunting strategies of owls. The algorithm is demonstrated here by minimizing the Sphere function, a standard benchmark in optimization problems.

Features
Fully vectorized and organized MATLAB code.

Dynamic parameter adaptation (beta) throughout iterations.

Utilizes intensity coefficients and distance-based updates.

Includes real-time convergence visualization.

Easily extensible for different objective functions or constrained optimization problems.

Files Included
OSA.m — Main script that runs the Owl Search Algorithm.

sphere.m — The Sphere test function (can be swapped for any custom cost function).

Algorithm Parameters
nvar — Number of decision variables (default: 10)

npop — Population size (default: 50)

maxiteration — Number of iterations (default: 1000)

alpha, beta — Algorithm-specific search parameters

varmin, varmax — Lower and upper bounds for each variable

Output
Displays best cost per iteration in the MATLAB command window.

Plots a convergence curve using semilogy.

Prints the final best solution and its associated cost.

Customization
To apply the algorithm to a different optimization problem:

Replace sphere.m with your own cost function.

Ensure the function accepts a vector input and returns a scalar cost.

Adjust varmin, varmax, and nvar accordingly in OSA.m.
