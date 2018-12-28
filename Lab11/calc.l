%{
#include "calc.h"
%}
%%
\* 		{return('*');}
\+		{return('+');}
[0-9]+		{ yylval = atoi(yytext); return (T_int);}
[\n]		{return(CR);}
. { /* ignore everything else */ }
%%
