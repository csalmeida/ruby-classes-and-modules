# Challenge: Custom Exceptions

Pick one of the previous challenges from the other sections or use one of the solutions of one of them, available  in this repository:

- [Dice](challenges/dice)
- [Radio](challenges/radio)
- [Secure Radio](challenges/secure-radio)
- [Birthdate Analysis](challenges/birth-date-analysis)
- [Todo List](challenges/to-do-list)

Once decided, find an appropriate place in that project, to use a custom exception class.

> Hint: Look for a place where you want to check for some condition that is exceptional. Maybe an argument that is passed in might be something unexpected or perhaps the result from a method or a block is unexpected. Any of these cases could be good candidates for an exception to be raised.

Once an appropriate place is found, define a custom exception to handle the unexpected behavior, customize it to your needs.

Finally, `raise` the exception in the correct place and `rescue` it.

This is an open ended challenge and there are multiple ways of solving it across different projects. The goal is to get hands-on experience when working with exceptions.