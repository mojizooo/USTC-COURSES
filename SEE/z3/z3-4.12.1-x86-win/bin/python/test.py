from z3 import *
import time


def minus(a, b):
    max_len = max(len("{:b}".format(a)), len("{:b}".format(b)))
    type_str = '{:0' + str(max_len) + 'b}'
    a_bin = type_str.format(a)
    b_bin = type_str.format(b)
    A = [Bool('a_%i' % (i + 1)) for i in range(max_len)]
    B = [Bool('b_%i' % (i + 1)) for i in range(max_len)]
    C = [Bool('c_%i' % i) for i in range(max_len + 1)]
    D = [Bool('d_%i' % (i + 1)) for i in range(max_len)]
    A_bool = And(
        [If(a_bin[i] == '0', Not(A[i]), A[i]) for i in range(max_len)])
    B_bool = And(
        [If(b_bin[i] == '0', Not(B[i]), B[i]) for i in range(max_len)])
    D_bool = And(
        [A[i] == (D[i] == (B[i] == C[i + 1])) for i in range(max_len)])
    C_bool = And([
        C[i] == Or(And(D[i], B[i]), And(D[i], C[i + 1]), And(B[i], C[i + 1]))
        for i in range(max_len)
    ])
    s = Solver()
    s.add(A_bool, B_bool, D_bool, C_bool, Not(C[0]), Not(C[max_len]))
    result = s.check()
    if result == sat:
        d = ""
        for i in range(max_len):
            if s.model()[D[i]] == True:
                d += '1'
            else:
                d += '0'
        print(int(d, 2))
        return int(d, 2)
        return None


minus(21, 8)
