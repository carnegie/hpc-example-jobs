import math
import numpy as np
from time import perf_counter

# Grid size
n = 10000

def integration2d_vectorized(n):
    global integral
    h = math.pi/float(n)

    # Create grid of points for x and y (using broadcasting)
    x = np.linspace(h/2, math.pi-h/2, n)
    y = np.linspace(h/2, math.pi-h/2, n)
    
    # Create a 2D grid of function values: sin(x + y)
    X, Y = np.meshgrid(x, y)
    Z = np.sin(X + Y)

    # Sum all the values in the grid and find the integral
    mysum = np.sum(Z)
    integral = h**2 * mysum

if __name__ == "__main__":
    starttime = perf_counter()
    integration2d_vectorized(n)
    endtime = perf_counter()
    
    # True value of the integral sin(x + y)
    true_value = 0.0
    
    print(f"Integral value is {integral:e}, Error is {abs(integral - true_value):e}")
    print(f"Time spent: {endtime - starttime:.2f} sec")
