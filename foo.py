def f4C(n):
    sequence = []
    for i in range(1, n+1):
        sequence = sequence + ["None"]
        sequence[0] = 1
        if len(sequence) > 1:
            sequence[i-1] = sequence[i-2]*i
    return sequence

print f4C(5)