%{
#include <stdio.h>
#include <assert.h>
static char varListIn, Typetype, id;
static void addtype(char id, char type);
%}
%token ID FLOAT INTEGER CR
%%

S : Decl CR
  ; 

Decl : Type VarList { varListIn = Typetype; }
     ; 

Type : INTEGER	{ varListIn = Typetype = 'i';}
     | FLOAT	{ varListIn = Typetype = 'f';}
     ;

VarList : ID ',' VarList 	{ addtype($1, varListIn); }
        | ID			{ addtype($1, varListIn); }
	;

%%

static void addtype(char id, char type){
    if (type=='i'){
        printf("< %c, INTEGER >\n", id);
    } else if (type=='f'){
        printf("< %c, FLOAT >\n", id);
    }
}

int main() {
	return yyparse();
}





