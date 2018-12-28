%{
#include <stdio.h>
#include <assert.h>
%}
%token T_int CR
%%

E  : E CR		{ printf("\noutput = %d", $1); }
   ;

E  : E '+' T		{ $$ = $1 + $3; printf("%d + %d = %d\n", $1, $3, $$);}
   | T			{ $$ = $1; }
   ;

T  : T '*' N		{ $$ = $1 * $3; printf("%d * %d = %d\n", $1, $3, $$);}
   | N
   ;

N  : T_int		{ printf("int = %d\n", $$);}
   ; 


%%

int main() {
	return yyparse();
}
