#!/usr/bin/env python
# Program that makes some personal questions

print('\n ~~ Questionnaire ~~ \n')

dq = {
    "What's your name?  ": '',
    "Where are you from?  ": '',
    "What's your favorite programming language (on this days)?  ": '',
    "What's your favorite relational DB?  ": '',
    "What's your favorite coding website?  ": ''
    }

for q in dq:
    dq[q] = input(q)

q, nm_a_loc = 1, ''

for k, v in dq.items():
    if q == 1:
        nm_a_loc += dq[k]
    elif q == 2:
        nm_a_loc += ' from ' + dq[k]
        print('\nHello ' + nm_a_loc + '. I learned that...')
    else:
        print('  -', k.lstrip("What's").rstrip('?  '), 'is: ', dq[k])
    q += 1

print('\nGoodbye ' + nm_a_loc + '. See you next time.\n')
r = input('Press return to close... ')

# print('\nGoobye {} from {}. See you next time.\n'.format(dq["What's your name?  "],
# dq["Where are you from?  "]))
