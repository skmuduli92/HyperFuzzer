from math import log2, ceil
from random import randint

def is_power_of_2(n):
    return (n & (n - 1)) == 0

def get_bits(c, n):
    i = c
    bits = []
    while i <= n: 
        bits += list(b-1 for b in range(i, i+c) if b <= n)
        i += 2*c
    return bits

def hamming(m):
    cheatsheet = []
    o_pos = 1
    o_cnt = 1
    i_pos = 0
    while i_pos < m:
        if is_power_of_2(o_pos):
            k = 2**(o_cnt-1)
            cheatsheet.append(-k)
            o_cnt += 1
        else:
            cheatsheet.append(i_pos)
            i_pos += 1
        o_pos += 1
    for i in range(len(cheatsheet)):
        if cheatsheet[i] < 0:
            bits = get_bits(-cheatsheet[i], len(cheatsheet))
            cheatsheet[i] = [cheatsheet[j] for j in bits[1:]]
        else:
            cheatsheet[i] = [cheatsheet[i]]
    return (cheatsheet)

def parity(inds, arr):
    parity = 0
    print ('parity:', inds, [arr[i] for i in inds])
    for i in inds:
        parity = parity ^ arr[i]
    return parity

def encode(cheatsheet, data):
    encoded = []
    for i in range(len(cheatsheet)):
        if isinstance(cheatsheet[i], int):
            encoded.append(data[cheatsheet[i]])
        else:
            encoded.append(None)
    for i in range(len(cheatsheet)):
        if isinstance(cheatsheet[i], list):
           encoded[i] = parity(cheatsheet[i][1:], encoded)

    return encoded            

def print_fun(cheatsheet):
    for i, bs in enumerate(cheatsheet):
        if len(bs) == 1:
            print ('y[%2d] = x[%d]' % (i, bs[0]))
        else:
            xor_str = ' ^ '.join('x[%d]' % di for di in bs)
            print ('y[%2d] = %s' % (i, xor_str))

cheatsheet = hamming(8)
print (cheatsheet)
print_fun (cheatsheet)

def encode(x):
    assert len(x) == 8
    y = [0] * 12
    y[ 0] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[6]
    y[ 1] = x[0] ^ x[2] ^ x[3] ^ x[5] ^ x[6]
    y[ 2] = x[0]
    y[ 3] = x[1] ^ x[2] ^ x[3] ^ x[7]
    y[ 4] = x[1]
    y[ 5] = x[2]
    y[ 6] = x[3]
    y[ 7] = x[4] ^ x[5] ^ x[6] ^ x[7]
    y[ 8] = x[4]
    y[ 9] = x[5]
    y[10] = x[6]
    y[11] = x[7]
    return y

def decode(y):
    assert len(y) == 12
    x = [0] * 8
    pos = 0
    error = False
    x[0] = y[ 2]
    x[1] = y[ 4]
    x[2] = y[ 5]
    x[3] = y[ 6]
    x[4] = y[ 8]
    x[5] = y[ 9]
    x[6] = y[10]
    x[7] = y[11]
    if y[ 0] != (x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[6]):
        error = True
        pos += 0
    if y[ 1] != (x[0] ^ x[2] ^ x[3] ^ x[5] ^ x[6]):
        error = True
        pos += 1
    if y[ 3] != (x[1] ^ x[2] ^ x[3] ^ x[7]):
        error = True
        pos += 3
    if y[ 7] != (x[4] ^ x[5] ^ x[6] ^ x[7]):
        error = True
        pos += 7
    if error:
        y[pos] = 1 ^ y[pos]
    x[0] = y[ 2]
    x[1] = y[ 4]
    x[2] = y[ 5]
    x[3] = y[ 6]
    x[4] = y[ 8]
    x[5] = y[ 9]
    x[6] = y[10]
    x[7] = y[11]

    return x

for i in range(0, 255):
    for i in range(100):
        l = ([int(d) for d in bin(i)[2:]])
        l += [0] * (8 - len(l))
        y = encode(l)
        idx = randint(0, len(y) - 1)
        y[idx] = 1 ^ y[idx]
        x = decode(y)
        print (x, l)
        assert (x == l)

#print (encode(cheatsheet, [1,0,0,1,1,0,1,0]))

