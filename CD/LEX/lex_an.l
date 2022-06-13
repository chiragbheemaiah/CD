%{
#include<stdio.h>
int op=0, id=0, ke=0;
%}
op [+|-|=|*|%]
id [for|while|do|if|else|break]
ke [a-z][a-z]*
%%
{op} {op++;}
{id} {id++;}
{ke} {ke++;}
"$" {printf("%d %d %d" , op, id, ke);}
%%
int main()
{
	yylex();
	exit(0);
}
int yywrap()
{
	return 1;
}
