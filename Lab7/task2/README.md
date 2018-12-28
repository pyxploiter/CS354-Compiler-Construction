# Lab Task
Simple calculator that recognizes and evaluates binary infix expressions using a stack </br>e.g. 4 + 8

# How to Run
Use following commands sequentially:
```shell
$ bison -d infix.y
```
```shell
$ gcc -c infix.tab.c
```
```shell
$ flex calc.l
```
```shell
$ gcc -c lex.yy.c
```
```shell
$ gcc -o PARSER lex.yy.o infix.tab.o -lfl -ly
```
```shell
$ ./PARSER
```
