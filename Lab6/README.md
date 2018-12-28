# Lab Task
## Postfix formula evaluation: 
Given an input text containing non-negative integers and three operator i.e. +, - and *, evaluate the given postfix formula using flex based lexical analyzer. 
For example given the following input: 44 33 22 * + 1 - { result = 769 }

# How to Run
Use following commands sequentially:
```shell
flex code.l
gcc lex.yy.c -lfl
./a.out
```
