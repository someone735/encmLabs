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

print(fast1)

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

print(sum(fast1)/3)
print(sum(fast2)/3)