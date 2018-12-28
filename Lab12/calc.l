%{
#include "calc.h"
%}
%%
float		{yylval = yytext; return(FLOAT);}
integer		{yylval = yytext; return(INTEGER);}
[,]		{return(',');}
[a-z]		{yylval = yytext[0]; return (ID);}
[\n]		{return(CR);}
. { /* ignore everything else */ }
%%
