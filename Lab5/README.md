# Lab Task
Write a flex program to process any simple program with the following specifications: 
• Match integers and floating point constants 
• Match  Identifiers,  starting  with  lower-case  alphabets  and  allowing  for integers in non-starting locations. 
• Keywords: if, then, begin, end, procedure, function 
Operators: +, -, *, / 
• Skipping  of  white-space  characters  i.e.  new-line,  tabs  and  spaces 
Printing of un-recognized characters 

# How to Run
Use following commands sequentially:
```shell
flex code.l
gcc lex.yy.c -lfl
./a.out
```
