%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "postfix.tab.h"

%}

%%

[ \t]	; // ignore all whitespace
[0-9]+		{yylval.ival = atoi(yytext); return INT;}
\n		{return NEWLINE;}
"+"		{return PLUS;}
"-"		{return MINUS;}
"*"		{return MULTIPLY;}
"/"		{return DIVIDE;}


%%
