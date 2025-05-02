# Test script for parallel R job based on example from OSC
# https://www.osc.edu/resources/available_software/software_list/r#9

# Calculate the sum of vectors from sampling a normal distribution using the R parallel library
library(parallel)
mySim <- function(run, size=1000000) {
  pid <- Sys.getpid()
  vec <- rnorm(size)
  sum_vec <- sum(vec)
  print(paste("Result of run ", run, " (with PID ", pid,"): ", sum_vec))
  return(sum(vec))
}
cores <- system("nproc", intern=TRUE)
print(paste("Using ", cores, " cores"))
start_time <- proc.time()

# Simulation runs
for(i in 1:100) {
  mySim(i)
}

print(paste("Running time of script:"))
result <- mclapply(1:100, function(i) mySim(i), mc.cores=cores)
running_time <- proc.time() - start_time
running_time