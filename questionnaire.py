#!/usr/bin/env python
# Program that makes some personal questions

print('\n ~~ Questionnaire ~~ \n')

# Use a dic to store both the questions and their (future) answers
dq = {
    "What's your name?  ": '',
    "Where are you from?  ": '',
    "What's your favorite programming language (on this days)?  ": '',
    "What's your favorite relational DB?  ": '',
    "What's your favorite coding website?  ": ''
    }

# Make the questions (q) - get the answers (in dq[q])
for q in dq:                # for every key (question) of dq{}
    dq[q] = input(q)

# Print the results, initialize two variales:
q = 1           # question number (begin in 1 - end in 5   )
nm_a_loc = ''   # name_and_location (born empty - end {name} from {location})

for k, v in dq.items():     # for every key, value pair of dq{}
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
