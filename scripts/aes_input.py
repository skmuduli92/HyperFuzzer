from Crypto.Cipher import AES
from Crypto.Random import random as rnd
import numpy as np

def bigint(a):
    sum = 0
    l = len(a)
    for i in range(l):
        sum += a[15-i] << (8*i)
    return sum
    
def makearr(bigint):
    a = bytearray(16)
    for i in range(16):
        a[15-i] = bigint & 0xFF
        bigint = bigint >> 8
    return a
    
def enc_ctr(): 
    global enc_blocks
    state = str(makearr(aes_ctr+enc_blocks))
    enc_blocks = enc_blocks + 0x10
    return state

def dec_ctr(): 
    global dec_blocks
    state = str(makearr(aes_ctr+dec_blocks))
    dec_blocks = dec_blocks + 0x10
    return state

# need to reverse byte order
key = bytearray(16)
for i in range(0,16):
    key[15-i] = i | i <<4
    # print format(key[i],'02X')

aes_ctrb = bytearray(16)
for i in range(16):
    aes_ctrb[15-i] = i*i*i & 0xFF
    #print format(aes_ctr[i],'02X')

aes_ctr = bigint(aes_ctrb)   
    

data0 = bytearray(32)
for i in range(16):
    data0[15-i] = i
    data0[31-i] = 16+i
    


# In[137]:

# make random data
data = bytearray(2*16)
for i in range(0,2):
    data[i*16:(i+1)*16] = makearr(rnd.getrandbits(8*16))
#print "".join("{:02X}".format(ord(c)) for c in str(data))


# In[138]:

encrypter = AES.new(str(key),AES.MODE_CTR,counter=enc_ctr)
decryptor = AES.new(str(key),AES.MODE_CTR,counter=dec_ctr)
enc_blocks = 0
dec_blocks = 0
en_text = encrypter.encrypt(str(data))
plain_text = decryptor.decrypt(en_text)


# In[139]:

#print "".join("{:02X}".format(ord(c)) for c in str(data))
#print "".join("{:02X}".format(ord(c)) for c in en_text)
#print "".join("{:02X}".format(ord(c)) for c in plain_text)


# In[131]:

f= open('aes_inputs.c','wb')
l = len(str(data))
bytes = l/16
count = 0
# set data array
for j in range(0,bytes):
    currpos = 16*(j+1)-1
    for i in range(0,16):
        f.write('data[%d] = 0x%02x;\n' % (count,ord(str(data)[currpos-i])))
        count = count + 1
        
# this is the encrypted array        
count = 0
for j in range(0,bytes):
    currpos = 16*(j+1)-1
    for i in range(0,16):
        f.write('cipher_txt[%d] = 0x%02x;\n' % (count,ord(en_text[currpos-i])))
        count = count + 1
f.close()


# In[145]:

# change the key

key1 = bytearray(16)
key1 = makearr(rnd.getrandbits(8*16))
#print "".join("{:02X}".format(ord(c)) for c in str(key1))

encrypter = AES.new(str(key1),AES.MODE_CTR,counter=enc_ctr)
decryptor = AES.new(str(key1),AES.MODE_CTR,counter=dec_ctr)
enc_blocks = 0
dec_blocks = 0
en_text = encrypter.encrypt(str(data0))
plain_text = decryptor.decrypt(en_text)

#print "".join("{:02X}".format(ord(c)) for c in str(data0))
#print "".join("{:02X}".format(ord(c)) for c in en_text)
#print "".join("{:02X}".format(ord(c)) for c in plain_text)

f= open('aes_keyin.c','wb')
l = len(str(data0))
bytes = l/16
count = 0
# set data array
for i in range(0,16):
    f.write('aes_reg_key1[%d] = 0x%02x;\n' % (count,ord(str(key1)[15-i])))
    count = count + 1
        
# this is the encrypted array        
count = 0
for j in range(0,bytes):
    currpos = 16*(j+1)-1
    for i in range(0,16):
        f.write('cipher_txt[%d] = 0x%02x;\n' % (count,ord(en_text[currpos-i])))
        count = count + 1
f.close()


# In[ ]:



