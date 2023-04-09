from z3 import *
import time


def n_queen_smt(n):
    Q = [Int('Q_%i' % (i + 1)) for i in range(n)]
    val_c = [And(1 <= Q[i], Q[i] <= n) for i in range(n)]
    col_c = [Distinct(Q)]
    diag_c = [
        If(i == j, True, And(i + Q[j] != j + Q[i], i - Q[j] != j - Q[i]))
        for i in range(n) for j in range(i)
    ]
    start = time.perf_counter()
    solve(val_c + col_c + diag_c)
    end = time.perf_counter()
    print('time for smt:', end - start, 's')


n_queen_smt(4)