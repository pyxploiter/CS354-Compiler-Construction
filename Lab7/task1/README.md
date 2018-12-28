# Lab Task
Simple calculator that recognizes and evaluates binary postfix expressions using a stack </br>e.g. 4 8 +

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
$ gcc -o PARSER lex.yy.o postfix.tab.o -lfl -ly
```
```shell
$ ./PARSER
```
