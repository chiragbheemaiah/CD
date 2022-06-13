%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int op=0, ke=0, id=0;
%}
op [+|-|*|%|/]
ke [if|else|for|while|do|break]
id [a-zA-Z]+
%%
{op} {op++;}
{ke} {ke++;}
{id} {id++;}
"$" {printf("%d %d %d", op, ke, id);}
%%
int main()
{
	yylex();
	
	return 0;
}
int yywrap()
{
	return 1;
}
