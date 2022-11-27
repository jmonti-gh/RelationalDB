#!/usr/bin/env python
# Bingo Number Generator

from random import randint
#https://stackoverflow.com/questions/3540431/what-is-the-difference-between-random-randint-and-randrange

print('\n ~~ Bingo Number Generator ~~  \n')

nbr = randint(1, 75)
text = 'The next number is, '
prg = 'BINGO'

print(text, prg[(nbr-1)//15], ':', nbr, '\n', sep='')
r = input('Press return to close...')

# Test:
# for i in (1, 15, 16, 30, 31, 45, 46, 60, 61, 74, 75):
#     print(text, prg[(i-1)//15], ':', i, sep='' )

#tl = ('B', 'I', 'N', 'G', 'O')
    
