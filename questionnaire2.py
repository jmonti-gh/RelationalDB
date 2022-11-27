#!/usr/bin/env python
# Program that makes some personal questions

print('\n ~~ Questionnaire ~~ \n')

# Use a 2-D list to store both the questions and their (future) answers
lq = [
    ["What's your name?  ", ''],
    ["Where are you from?  ", ''],
    ["What's your favorite programming language (on this days)?  ", ''],
    ["What's your favorite relational DB?  ", ''],
    ["What's your favorite coding website?  ", '']
]

# Make the questions (el[0]) - get the answers (in el[1])
for el in lq:
    el[1] = input(el[0])

# Print the results
nm_a_loc = lq[0][1] + ' from ' + lq[1][1]               # name_and_location var
print('\nHello ' + nm_a_loc + '. I learned that...')    # 1st line to show

for i in range(2, len(lq)):         # rest of lines from third to lastm el of lq
     print('  -', lq[i][0].lstrip("What's").rstrip('?  '), 'is: ', lq[i][1])

print('\nGoodbye ' + nm_a_loc + '. See you next time.\n')
r = input('Press return to close... ')

# for i in range(len(lq)):
#     lq[i][1] = input(lq[i][0])
