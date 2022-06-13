%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER ID
%left '+' '-'
%left '*' '/'

%%
expr	: expr '+' expr
	| expr '-' expr
	| expr '*' expr
	| expr '/' expr
	| '(' expr ')'
	| NUMBER
	| ID
	;
%%

int main()
{
	printf("ENTER EXPRESSION");
	yyparse();
	printf("Valid!!");
	exit(0);
}
int yyerror(char *s)
{
	printf("Invalid!!");
	exit(0);
}
int yywrap()
{
	return 0;
}
