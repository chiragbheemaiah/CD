%{
#include<stdio.h>
#include"y.tab.h"
void yyerror(char *);
int yylval;
int yylineno;
%}
num [0-9]
intg {num}{num}*
floa {num}{num}*.({num}{1,2})
doub {num}{num}*.({num}{3,8})
%%
{intg} { return INTEGER; }
{floa} { return FLOAT; }
{doub} { return DOUBLE; }
[+=\n] return *yytext;
[)( \t] {;}
%%
int yywrap()
{
return 1;
} 

