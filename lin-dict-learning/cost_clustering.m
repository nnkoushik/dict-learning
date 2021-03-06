function cost = cost_clustering( G, U, L, UtG, UtGU )
%COST_CLUSTERING Cost function for k-means clustering
%   This function computes the cost function for k-means clustering. This,
%   along with its gradient (computed in update_atoms_cluster.m), are used
%   in the gradient descent step of the k-means clustering algorithm,
%   implemented in k_means_*.m.
%
%   The cost is defined as the sum of the squares of the distances of each
%   input from its representative atom in the dictionary.

m = size(U, 2);

costs = zeros(1, m);

parfor i = 1:m
  costs(i) = (size(G(L == i, :), 1) * UtGU(i, i)) - ...
    (2 * sum(UtG(i, L == i)));
end

cost = sum(diag(G)) + sum(costs);
end