######################################################
import sys
sys.setrecursionlimit(16000)
######################################################
sys.path.append('./../../MySolution/Python')
######################################################
from assign04_06 import *
######################################################
def nqueen(bd):
    res = 0
    for j0 in bd:
        if j0 <= 0:
            break
        else:
            res = res + 1
    return res
def board_safety_all(bd):
    return \
        int1_forall\
        (nqueen(bd), \
         lambda i0: board_safety_one(bd, i0))
def board_safety_one(bd, i0):
    def helper(j0):
        pi = bd[i0]
        pj = bd[j0]
        return pi != pj and abs(i0-j0) != abs(pi-pj)
    return int1_forall(i0, helper)
####################################################
theNQueenSols_10 = solve_N_queen_puzzle(10)
######################################################
theNQueenSols_16 = solve_N_queen_puzzle(16)
######################################################
theNQueenSols_20 = solve_N_queen_puzzle(20)
######################################################
fxs = theNQueenSols_16
cxs = fxs()
fxs = cxs.arg2
print(cxs.arg1)
assert(board_safety_all(cxs.arg1))
cxs = fxs()
fxs = cxs.arg2
print(cxs.arg1)
assert(board_safety_all(cxs.arg1))
######################################################
fxs = theNQueenSols_20
cxs = fxs()
fxs = cxs.arg2
print(cxs.arg1)
assert(board_safety_all(cxs.arg1))
cxs = fxs()
fxs = cxs.arg2
print(cxs.arg1)
assert(board_safety_all(cxs.arg1))
######################################################
assert(stream_forall\
       (theNQueenSols_10, \
        lambda bd: nqueen(bd)==10 and board_safety_all(bd)))
# stream_iforeach\
#    (theNQueenSols_10, lambda i, bd: print("solution(",i+1,") =", bd))
######################################################
print("Assign04-06-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign04_06_test.py] ####
