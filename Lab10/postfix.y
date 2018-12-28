%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
%}

%union {
	int ival;
}

%token<ival> INT
%token PLUS MINUS MULTIPLY DIVIDE 
%token NEWLINE 
%left PLUS MINUS
%left MULTIPLY DIVIDE

%type<ival> E

%start S

%%

S:
 | S E NEWLINE { printf("\tResult = %i\n", $2); }
;

E: INT		        { $$ = $1; }
  | E E PLUS	        { $$ = $1 + $2; }
  | E E MINUS	        { $$ = $1 - $2; }
  | E E MULTIPLY 	{ $$ = $1 * $2; }
  | E E DIVIDE 	        { $$ = $1 / $2; }
;

%%
int main() {
	yyin = stdin;
	do {
		yyparse();
	} while(!feof(yyin));
	return 0;
}
void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}
