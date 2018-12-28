# Lab Task
Perform the task of postfix evaluation using SDD.

# How to Run
Use following commands sequentially:
```shell
$ bison -d postfix.y
```
```shell
$ gcc -c postfix.tab.c
```
```shell
$ flex calc.l
```
```shell
$ gcc -c lex.yy.c
```
```shell
$ gcc -o app lex.yy.o postfix.tab.o -lfl -ly
```
```shell
$ ./app
```
