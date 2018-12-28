bison --defines -o calc.c calc.y
flex -o calc2lex.c calc.l
gcc -o calc calc.c calc2lex.c -ly -lfl
