start = 0
finish = 3
for i in range(start,finish):
    print("(AND (EQL (array1["+str(i)+"]) (array2["+str(i)+"])) ",end="")
# remove space at the end here. No space should be there between )) )) => ))))
for i in range(start,finish):
    print(")",end="")
