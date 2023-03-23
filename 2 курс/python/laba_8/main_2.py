import numpy as np
import random
import scipy.stats as sps

a = np.random.sample((1, 3))
a = list(a)
b = np.random.sample((1, 3))
b = list(b)

print(a,b)

def scalar_product(a, b):
    s = 0
    for x, y in zip(a,b):
        s += x * y  
    return s

def np_scalar_product(a,b):
    a_np = np.array(a)
    b_np = np.array(b)
    return a_np.dot(b_np)


product_1 = scalar_product(a,b)
product_2 = np_scalar_product(a,b)

# проверим корректность:
assert np.allclose(product_1, product_2)


