#!/usr/bin/env python
# Program that counts down to zer from a given argument

import time
import sys

print('\n ~~ Countdown Time ~~  ', sys.argv[0], '\n')

try:
    n = int(sys.argv[1])
    assert n > 0
    for i in range(n, -1, -1):
        # print(i, end=" ")
        print('',i)
        time.sleep(1)
    print()
except (IndexError, ValueError, AssertionError):
    print('Include a positive integer as the first argument')
finally:
    print('\n ~~ The End ~~ \n')
