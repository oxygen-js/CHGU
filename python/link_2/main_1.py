K = int(input("K: "))

def DigitN(K, N):
    if (K < N):
        return -1
    return str(K)[N-1:N]


print(DigitN(K, 1))
print(DigitN(K, 2))
print(DigitN(K, 3))
print(DigitN(K, 4))
print(DigitN(K, 5))
    
