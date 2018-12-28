integer [0-9]
float {integer}+.{integer}+
alphanum [0-9A-Za-z]
identifier ([a-z]+{alphanum}*)
keyword (("if")|("then")|("begin")|("end")|("procedure")|("function"))
operator [+*/-]

%%
{keyword} {printf("A keyword: "); ECHO; printf("\n");}
{float} {printf("A float: "); ECHO; printf("\n");}
{integer} {printf("An integer: "); ECHO; printf("\n");}
{operator} {printf("An Operator: "); ECHO; printf("\n");}
([\n\t" "]) {}
{identifier} {printf("An identifier: "); ECHO; printf("\n");}
. {printf("Unrecognized character: "); ECHO; printf("\n");}
%%

int main(int argc, char **argv){

if(argc>1)
yyin=fopen(argv[1],"r");
else
yyin=stdin;
yylex();
}
