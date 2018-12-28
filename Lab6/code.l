%{
#include <stdio.h>
int s[4];
void printstack();
void push(int);
void addition();
void subtraction();
void multiplication();
%}
%%
\n {printf("\n RESULT = %d\n",s[0]);}
([0-9]+) {printf(" "); push(atoi(yytext)); printstack();}
\+ {addition(); printstack();}
\- {subtraction(); printstack();}
\* {multiplication(); printstack();}
%%
void printstack(){
printf("\n %d %d %d %d",s[0],s[1],s[2],s[3]);
}
void push(int x){
s[3] = s[2];
s[2] = s[1];
s[1] = s[0];
s[0] = x;
}
void addition(){
printf("%d", s[0]);
s[0] = s[1]+s[0];
s[1] = s[2];
s[2] = s[3];
}
void subtraction(){
s[0] = s[1]-s[0];
s[1] = s[2];
s[2] = s[3];
}
void multiplication(){
s[0] = s[1]*s[0];
s[1] = s[2];
s[2] = s[3];
}

int main(int argc, char **argv)
{

if(argc>1)
yyin=fopen(argv[1],"r");
else
yyin=stdin;
yylex();

}
