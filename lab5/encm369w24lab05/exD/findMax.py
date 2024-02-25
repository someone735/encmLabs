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

print(f'Quickest times for use_pointers: {fast1}' )
print(f'Quickest times for use_indexes: {fast2}' )
print(f'Average quickest time for use_pointers: ({fast1[0]} + {fast1[1]} + {fast1[2]})/3 = {a}')
print(f'Average quickest time for use_indexes: ({fast2[0]} + {fast2[1]} + {fast2[2]})/3 = {b:.3f}')
print(f'Speedup (use_indexes / use_pointers): {b:.3f}/{a} = {b/a:.3f} \n')

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

print(f'Quickest times for use_pointers: {o2fast1}' )
print(f'Quickest times for use_indexes: {o2fast2}' )
print(f'Average quickest time for use_pointers: ({o2fast1[0]} + {o2fast1[1]} + {o2fast1[2]})/3 = {c:.3f}')
print(f'Average quickest time for use_indexes: ({o2fast2[0]} + {o2fast2[1]} + {o2fast2[2]})/3 = {d:.3f}')
print(f'Speedup (use_pointers (no-opt) / use_pointers (O2)): {a}/{c:.3f} = {a/c:.3f}')
print(f'Speedup (use_indexes (no-opt) / use_indexes (O2)): {b:.3f}/{d:.3f} = {b/d:.3f} \n')

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

print(f'Quickest times for use_pointers: {unrollfast1}' )
print(f'Quickest times for use_indexes: {unrollfast2}' )
print(f'Average quickest time for use_pointers: ({unrollfast1[0]} + {unrollfast1[1]} + {unrollfast1[2]})/3 = {e:.3f}')
print(f'Average quickest time for use_indexes: ({unrollfast2[0]} + {unrollfast2[1]} + {unrollfast2[2]})/3 = {f:.3f}')
print(f'Speedup (use_pointers (O2) / use_pointers (unroll)): {c:.3f}/{e:.3f} = {c/e:.3f}')
print(f'Speedup (use_indexes (O2) / use_indexes (unroll)): {d:.3f}/{f:.3f} = {d/f:.3f}')

# print(c/e)
# print(d/f)