#!/usr/bin/env python
# Program that counts down to zero from a given argument

import time
import sys

print('\n ~~ Countdown Timer ~~  ', sys.argv[0], '\n')

try:
    n = int(sys.argv[1])
    assert n > 0
    i = n
    while i >= 0:
        print('',i)
        time.sleep(1)
        i -= 1
except (IndexError, ValueError, AssertionError):
    print('Include a positive integer as the first argument')
finally:
    print('\n ~~ The End ~~ \n')
