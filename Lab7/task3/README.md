# Lab Task
Simple calculator that recognizes and evaluates binary prefix expressions using a stack </br>e.g. + 4 8

# How to Run
Use following commands sequentially:
```shell
$ bison -d prefix.y
```
```shell
$ gcc -c prefix.tab.c
```
```shell
$ flex calc.l
```
```shell
$ gcc -c lex.yy.c
```
```shell
$ gcc -o PARSER lex.yy.o prefix.tab.o -lfl -ly
```
```shell
$ ./PARSER
```
