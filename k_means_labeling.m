function ret = k_means_labeling( X, D )
n = size(X, 2);
m = size(D, 2);
ret = zeros(n, 1);
for i = 1:n
  dists = zeros(m, 1);
  for j = 1:m
    dists(j) = measure(log_map(X(1:end, i), D(1:end, j)), D(1:end, j));
  end
  [~, I] = min(dists);
  ret(i) = I;
end
end