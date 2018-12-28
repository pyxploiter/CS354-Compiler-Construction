# Lab Task
## Postfix formula evaluation: 
Given an input text containing non-negative integers and three operator i.e. +, - and *, evaluate the given postfix formula using flex based lexical analyzer. </br>
For example given the following input: 44 33 22 * + 1 -</br>{ result = 769 }

# How to Run
Use following commands sequentially:
```shell
$ flex code.l
```
```shell
$ gcc lex.yy.c -lfl
```
```shell
$ ./a.out
```
