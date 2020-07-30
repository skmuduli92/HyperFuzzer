#~ /use/bin/python2.7
import sys
import os
import hashlib
import hmac
import binascii
import math

def read_in(filename):
    data = []
    with open(filename, 'rt') as fileobject:
        for line in fileobject:
            line - line.strip()
            comment_start = line.find('//')
            if comment_start != -1:
                line = line[:comment_start].strip()
            if len(line) == 0:
                continue
            words = line.split()
            assert len(words) == 1
            byte = int(words[0], 16)
            data.append(byte)
    return data

def read_hex(filename):
    data_dict = {}
    data = []
    with open(filename, 'rt') as fileobject:
        for line in fileobject:
            line = line.strip()
            if len(line) == 0:
                continue
            if line[0] != ':':
                print filename, line
            assert line[0] == ':'
            line = line[1:]
            length_str = line[:2]
            addr_str = line[2:6]
            type_str = line[6:8]
            data_str = line[8:-2]

            data_length = int(length_str, 16)
            start_addr = int(addr_str, 16)
            record_type = int(type_str, 16)

            assert 2*data_length == len(data_str)
            data_bytes = [int(data_str[i:i+2], 16) for i in xrange(0,2*data_length,2)]
            assert len(data_bytes) == data_length

            if record_type == 0:
                for i, addr in enumerate(xrange(start_addr, start_addr+data_length)):
                    data_dict[addr] = data_bytes[i]

            data = [-1] * (max(data_dict.keys())+1)
            for addr in data_dict:
                data_value = data_dict[addr]
                assert data[addr] == -1
                data[addr] = data_value
            for i in xrange(len(data)):
                if data[i] == -1:
                    data[i] = 0
    return data

def int2bytes(num, numbytes):
    array = bytearray(numbytes)
    for i in xrange(numbytes):
        array[numbytes-i-1] = num >> (i*8) & 0xFF
    return array

class PRF:
    def __init__(self, seed):
        self.key = bytearray(seed)
        #print ",".join("{:02X}".format(ord(c)) for c in self.key)

    def eval(self, message):
        return bytearray(hmac.new(self.key,message,hashlib.sha1).digest())

class PRGen:
    zero = bytearray([0x98, 0xBC, 0x1B, 0x58,
                      0xC2, 0x5B, 0x7B, 0x51,
                      0x48, 0x14, 0x83, 0xA7,
                      0xEA, 0xDB, 0x15, 0x2E,
                      0xCE, 0x7A, 0xE1, 0x0C,
                      0xF7, 0x1D, 0x96, 0xDE,
                      0xDE, 0x16, 0x68, 0x61,
                      0x48, 0x25, 0x99, 0x66])

    one = bytearray([0xA2, 0x66, 0x95, 0x53,
                     0x0E, 0x13, 0x56, 0xA9,
                     0xDF, 0x42, 0x6F, 0x0F,
                     0x74, 0xA4, 0x06, 0xFF,
                     0xA0, 0x6D, 0x07, 0x17,
                     0x30, 0xAE, 0x16, 0xD2,
                     0x87, 0x76, 0x8A, 0x9B,
                     0x92, 0xAE, 0x36, 0xB9])

    def __init__(self, key):
        self.state = bytearray(key)

    def next(self, numbytes):
        assert numbytes <= 20
        prf = PRF(self.state)
        byteResult = prf.eval(self.zero)
        nextState = prf.eval(self.one)
        self.state = nextState
        #print "".join("{:02X}".format(ord(c)) for c in self.state)
        return byteResult[:numbytes]
#        intResult = 0
#        for i in xrange(bits):
#            thisBit = byteResult[i] & 1 << i
#            intResult = intResult | thisbit
#        return intResult

def padMessage(msg):
    assert len(msg) <= 222 #256-16-16-1-1
    out = bytearray(223)
    out[:len(msg)] = msg
    out[len(msg)] = 1
    #print "".join("{:02X}".format(ord(c)) for c in out)
    return out

def unpadMessage(msg):
    if msg is None: return None
    assert len(msg) == 223

    length = -1
    for length in xrange(len(msg)-1,-1,-1):
        if msg[length] == 1: break
        else: assert msg[length] == 0
    assert length != -1
    return msg[:length]

def getOAEPGen(r):
    assert len(r) == 16
    k = bytearray(20)
    k[:16] = r
    return PRGen(k)

OAEPHSEED = bytearray([
        0x66, 0x02, 0x5D, 0xC9,
        0x80, 0x48, 0xA5, 0x9F,
        0x2C, 0xB3, 0xAA, 0x6C,
        0x1A, 0x81, 0xA9, 0xAA,
        0xE8, 0x93, 0x21, 0x0E])#,
#        0x24, 0x99, 0x6F, 0x06,
#        0xEB, 0xC0, 0x4F, 0x3A,
#        0x0D, 0x2F, 0x8F, 0x0A])

rprg = PRGen(bytearray([0x14, 0xb8, 0xfb, 0x04,
                   0x98, 0x43, 0x98, 0xa2,
                   0x35, 0xd0, 0x3e, 0xca,
                   0x38, 0xd9, 0x41, 0xaf]))

def addOAEP(msg):
    assert len(msg) == 223
    paddedMsg = bytearray(255)
    paddedMsg[:len(msg)] = msg
    r = rprg.next(16)
    #print "".join("{:02X}".format(ord(c)) for c in str(r))
    g = getOAEPGen(r)
    # X
    n = len(msg) + 16
#    for i in xrange(n):
#        paddedMsg[i] = paddedMsg[i] ^ g.next(1)
    for i in xrange(0,len(msg)+16,20):
        nexthash = g.next(20)
        #print "".join("{:02X}".format(ord(c)) for c in str(nexthash))
        end = min(i+19,n-1)
        #print "".join("{:02X}".format(ord(c)) for c in str(nexthash[:end%20]))
        paddedMsg[i:end+1] = map(int.__xor__,paddedMsg[i:end+1],nexthash[:(end%20)+1])
        #print  "".join("{:02X}".format(ord(c)) for c in str(paddedMsg[i:end+1]))
    #print "".join("{:02X}".format(ord(c)) for c in paddedMsg[:20])
    # Y
    h = PRF(OAEPHSEED)
    yhash = h.eval(paddedMsg[:n])
    #print "".join("{:02X}".format(ord(c)) for c in str(yhash))
    paddedMsg[n:] = map(int.__xor__,yhash[:16],r)

    return paddedMsg

def removeOAEP(msg):
    if msg is None: return None
    if len(msg) != 255: return None

    h = PRF(OAEPHSEED)
    yhash = h.eval(msg[:len(msg)-16])
    r = bytearray(map(int.__xor__,yhash[:16],msg[len(msg)-16:]))
    #print
    #print "".join("{:02X}".format(ord(c)) for c in r)
    g = getOAEPGen(r)
    for i in xrange(0,239,20):
        nexthash = g.next(20)
        #print "".join("{:02X}".format(ord(c)) for c in nexthash)
        end = min(i+19,238)
        msg[i:end+1] = map(int.__xor__,msg[i:end+1],nexthash[:end%20+1])
    if cmp(msg[223:239],bytearray(16)): return None
    #print "".join("{:02X}".format(ord(c)) for c in msg[:233])
    return msg[:223]

def addMarkerByte(msg):
    out = bytearray([1])
    out.extend(msg)
    return out

def removeMarkerByte(out):
    if out is None: return None
    if not len(out): return None
    if out[0] != 0x01: return None

    return out[1:]

# key pairs generated by rsakeyin.py
public = 65537
modulus = 0x98a918a2a7a893f779e0c1b7e6208904e973b45db2a3d34794ee237e01c1f2d74b93764bc82ff8a90c356fc363eb34aa48dadfe815222f87a9c04c6ece584fc9ab3db560fd36d1bea51bf63a00c13f41cfbd60bd59ccbdf0fbefcd24267c16205c2b6249c39d58482267abd60ead9e09b5f9ee89d8e8ba5d2818c0ff52f165ee4f352338545db40a368f1962303bf9899cece30af26c7e6bf90a4baaf3eced8e29da8f744ac840d0aaf97c400b1d856383f60ec9e6abb62ed5e7e97b3b4aae55519e4f3cae5d3a979279fe2ad1a0bdbe559b307bd948c659967eddeae518080065c985a6b058f297835d1d8fdf81573b446a7a9c1ac4b05527d5327b247e18a9
private = 0x2f17d2e2b267bda595327170028cbcd808104a6eb121fa96556a1506d511f890d3de9c9a8a19ca5293d29434a9493088eb4aa1d1dd5b1b60754c3e07dc9dbf974dbd0e8be9f11449047418c411e18b5b08f3b9b90fcfaa3481f39acbf1174c581536c8ee4a6aea85ee1f1f123c9af06abc796a4d99dd49485d8b2d565646e39361e5e38e2fea2c0be8fb174680f10960db2513a7068c2255f00b31cc804f06194b85e02d19ded53d57d2241f6b5f0b6045561629194d7cdc33da82efc40b58e6e337290fd6692bc61f4402fb8560ec4be23a9d3597c1a4867b93f4a4961b055b54b06cbabb6b965c2b4f70f60b1ff76fc405626f20b45aacd2f0239a4bd95335

def preprocess(plaintext):
    padded = addMarkerByte(addOAEP(padMessage(plaintext)))
    print "padded ", len(padded)
    print  "".join("{:02X}".format(ord(c)) for c in str(padded))
    return padded

def encrypt(padded, exp):
    x = int(binascii.hexlify(padded), 16)
    print '%X' %x
    c = pow(x,exp,modulus)
    #print
    #print 'c: %X' %c
    return c

def decrypt(c, exp):
    m = pow(c,exp,modulus)
    #print '%X' %m
    data = int2bytes(m,256)
    #print "".join("{:02X}".format(ord(c)) for c in data)
    unpadded = unpadMessage(removeOAEP(removeMarkerByte(data)))
    return unpadded

SIGNSEED = bytearray([
        0x22, 0x1B, 0x35, 0xA1,
        0xC2, 0x30, 0x6A, 0x0B,
        0xF6, 0xDA, 0xDE, 0x2C,
        0x7A, 0x2D, 0x58, 0x42,
        0x4C, 0xED, 0x43, 0x13,
        0x5E, 0x71, 0x6D, 0xA4,
        0x80, 0xBE, 0x9D, 0x47,
        0x4A, 0x9A, 0xAC, 0xA8])

def sign(data):
    #print("data",data,len(data))
    assert not(data is None)
    sha = hashlib.sha1()
    sha.update(data)
    hashed = bytearray(sha.digest())
    print "data"
    print "".join("{:02X}".format(ord(c)) for c in str(data))
    print "hash"
    print "".join("{:02X}".format(ord(c)) for c in str(hashed))
    return encrypt(preprocess(hashed), private)

def verifySig(data, sig):
    assert not (sig is None or data is None)
    sha = hashlib.sha1()
    sha.update(data)
    hashed = bytearray(sha.digest())

    return not cmp(decrypt(sig, public),hashed)

class Module:
    def __init__(self, data, addr):
        self.addr = addr
        self.size = len(data)
        self.data = data
        #self.sign = sign(data)
        #assert verifySig(data, self.sign)
        sha = hashlib.sha1()
        sha.update(data)
        self.hash = bytearray(sha.digest())


class Image:
    def __init__(self, data, exp, mod):
        S = 256
        N = int(math.ceil(len(data)*1./S))
        self.modules = [0]*N

        # keys
        self.head = int2bytes(exp, 256)
        self.head.extend(int2bytes(mod, 256))
        # num modules
        self.head.extend(bytearray([N & 0xFF, N >> 8, 0, 0]))
        print("N ", N);
        print([N & 0xFF, N >> 8, 0, 0])
        # modules data
        for i in xrange(N):
            module = Module(data[i*S:min((i+1)*S,len(data))], i*S)
            print "module :",i, len(module.data)
            print "".join("{:02X}".format(ord(c)) for c in str(module.data))
            #print "module ",module.data,len(module.data);
            self.modules[i] = module
            addr = module.addr
            self.head.extend(bytearray([addr & 0xFF, addr >> 8, 0, 0]))
            size = module.size
            self.head.extend(bytearray([size & 0xFF, size >> 8, 0, 0]))
            self.head.extend(module.hash)
            print "module hash :",i, len(module.data)
            print "".join("{:02X}".format(ord(c)) for c in str(module.hash))

        # put everything together
        self.image = int2bytes(sign(self.head), 256)  # signature of header
        print "self head", len(self.head)
        print "".join("{:02X}".format(ord(c)) for c in str(self.head))
        self.image.extend(self.head)             # header
        for i in xrange(N):                      # modules
            self.image.extend(self.modules[i].data)
            #self.image.extend(int2bytes(self.modules[i].sign, 256))

def makefile(data):
    bootimage = Image(data, public, modulus)
    print "image "
    print ''.join('{:02x}'.format(x) for x in bootimage.image)
    with open('prog.hex','wt') as f:
        for i,b in enumerate (bootimage.image):
            print >> f, "%02X" %b,

def main(argv):
    if len(argv) != 2:
        print 'Usage: %s <hex-file>' %argv[0]
    else: # read in hex file
        filename = argv[1]
        if filename.endswith('.hex') or filename.endswith('.ihx'):
            data = read_hex(filename)
            #print data[:256]
            #print data[256:]
            data = bytearray(data)
            #print data
        elif filename.endswith('.in'):
            data = read_in(filename)

        # hash keys
        #sha = hashlib.sha1()
        #sha.update(int2bytes(public, 256))
        #sha.update(int2bytes(modulus, 256))
#        print ", 0x".join("{:02X}".format(ord(c)) for c in sha.digest())
        makefile(data)

if __name__ == '__main__':
    main(sys.argv)
