arr1 = [211433.00, 207463.00, 222601.00, 
        237517.00, 178258.00, 180647.00, 
        180940.00, 180846.00, 180921.00,
        180497.00]

arr2 = [228333.00, 228759.00, 228754.00, 
        214871.00, 196672.00, 196751.00, 
        199721.00,196903.00, 196915.00,
        196784.00]

fast1 = [x for x in arr1[:3]]
fast2 = [x for x in arr2[:3]]

# print(len(fast1), len(fast2))



for x in arr1[3:]:
    for i,j in enumerate(fast1):
        if x < j:
            fast1[i] = x
            break
        
for x in arr2[3:]:
    for i,j in enumerate(fast2):
        if x < j:
            fast2[i] = x
            break

a = (sum(fast1)/3)
b = (sum(fast2)/3)

# print(b/a)

o2arr1 = [53704.00, 49454.00, 49503.00, 
          49421.00, 49528.00, 49502.00, 
          49491.00, 51998.00, 49415.00, 
          49495.00]
o2arr2 = [49860.00, 49431.00, 49486.00, 
          49392.00, 49453.00, 49449.00, 
          49473.00, 49479.00, 49398.00, 
          49424.00]

o2fast1 = [x for x in o2arr1[:3]]
o2fast2 = [x for x in o2arr2[:3]]




for x in o2arr1[3:]:
    for i,j in enumerate(o2fast1):
        if x < j:
            o2fast1[i] = x
            break
        
for x in o2arr2[3:]:
    for i,j in enumerate(o2fast2):
        if x < j:
            o2fast2[i] = x
            break

c = (sum(o2fast1)/3)
d = (sum(o2fast2)/3)

# print(a/c)
# print(b/d)

unrollarr1 = [49898.00, 46890.00, 46932.00, 
              46880.00, 46925.00, 46908.00, 
              46921.00, 48352.00, 45888.00, 
              45821.00]
unrollarr2 = [47024.00, 46937.00, 46968.00, 
              46908.00, 46987.00, 46936.00,
              46948.00, 45888.00, 45891.00,
              45895.00]

unrollfast1 = [x for x in unrollarr1[:3]]
unrollfast2 = [x for x in unrollarr2[:3]]

for x in unrollarr1[3:]:
    for i,j in enumerate(unrollfast1):
        if x < j:
            unrollfast1[i] = x
            break
        
for x in unrollarr2[3:]:
    for i,j in enumerate(unrollfast2):
        if x < j:
            unrollfast2[i] = x
            break

e = (sum(unrollfast1)/3)
f = (sum(unrollfast2)/3)

print(c/e)
print(d/f)