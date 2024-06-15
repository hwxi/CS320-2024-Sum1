######################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign04_07 import *
######################################################
# stream_iforall\
#     (doublet_stream_from('water'), \
#      lambda i, x: i < 1000 and not(print(i,":",x)))
######################################################
assert\
    (len(stream_get_at(doublet_stream_from('water'), 672))==5)
assert\
    (len(stream_get_at(doublet_stream_from('water'), 673))==6)
######################################################
print("Assign04-07-test passed!")
######################################################
#### end of [CS320-2024-Sum1-assign04_07_test.py] ####
