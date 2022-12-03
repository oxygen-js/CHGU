import numpy as np
import scipy.stats as sps


A = sps.uniform.rvs(size=2**3) 

def cumsum(A):
    return [np.cumsum(x) for x in A]


print(cumsum(A))
