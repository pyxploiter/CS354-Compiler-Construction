# Lab Task
## Write a flex program to process any simple program with the following specifications:
• Match integers and floating point constants <br/>
• Match  Identifiers,  starting  with  lower-case  alphabets  and  allowing  for integers in non-starting locations. <br/>
• Keywords: if, then, begin, end, procedure, function <br/>
• Operators: +, -, *, / <br/> 
• Skipping  of  white-space  characters  i.e.  new-line,  tabs  and  spaces 
Printing of un-recognized characters <br/>

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
