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
    interval = end - start
    print('time for smt:', interval, 's')
    return interval


def n_queen_sat(n):
    Q = [Bool('Q_%i_%i' % (i + 1, j + 1)) for i in range(n) for j in range(n)]
    row_c = [
        Or([
            Not(
                Or([
                    If(i == k, Not(Q[j * n + i]), Q[j * n + i])
                    for i in range(n)
                ])) for k in range(n)
        ]) for j in range(n)
    ]
    col_c = [
        Or([
            Not(
                Or([
                    If(j == k, Not(Q[j * n + i]), Q[j * n + i])
                    for j in range(n)
                ])) for k in range(n)
        ]) for i in range(n)
    ]

    right_up = []
    for j in range(2 * n - 1):
        temp1 = []
        for i in range(n):
            if (j - i < n and j - i >= 0):
                temp1 += [Q[(j - i) * n + i]]
        temp2 = [Not(Or(temp1))]
        for a in range(len(temp1)):
            temp3 = []
            for b in range(len(temp1)):
                if (b == a):
                    temp3 += [Not(temp1[b])]
                else:
                    temp3 += [temp1[b]]
            temp2 += [Not(Or(temp3))]
        right_up += [Or(temp2)]
    right_down = []
    for j in range(-n + 1, n):  #0-3
        temp1 = []
        for i in range(n):
            if (j + i < n and j + i >= 0):
                temp1 += [Q[(j + i) * n + i]]
        temp2 = [Not(Or(temp1))]
        for a in range(len(temp1)):
            temp3 = []
            for b in range(len(temp1)):
                if (b == a):
                    temp3 += [Not(temp1[b])]
                else:
                    temp3 += [temp1[b]]
            temp2 += [Not(Or(temp3))]
        right_down += [Or(temp2)]
    diag_c = [And(And(right_up), And(right_down))]

    start = time.perf_counter()
    solve(row_c + col_c + diag_c)
    end = time.perf_counter()
    interval = end - start
    print('time for sat:', interval, 's')
    return interval


n = input('')
m = int(n)
print(n_queen_sat(m) - n_queen_smt(m))
