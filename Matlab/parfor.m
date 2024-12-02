% Matlab example taken from the Matlab tutorials mathworks.com/help/parallel-computing/interactively-run-a-loop-in-parallel.html

% parallel MATLAB script with parfor that calculates the spectral radius of a matrix
cpus = str2num(getenv("SLURM_CPUS_PER_TASK"));
cluster = parcluster;
poolobj = parpool(cluster,cpus-1);
fprintf('Number of workers: %g\n', poolobj.NumWorkers);

tic
n = 20;
A = 50;
a = zeros(n);
parfor (i=1:n,cluster) 
    start_time = datetime;
    a(i) = max(abs(eig(rand(A))));
    fprintf('Iteration %g started %s: %g (took %gs)\n', i, start_time, a(i), seconds(datetime - start_time));
end
toc