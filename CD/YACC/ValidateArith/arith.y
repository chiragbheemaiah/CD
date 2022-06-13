%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER ID  // token from lex file
%left '+' '-'    // left associative 
%left '*' '/'

%%
expr: expr '+' expr // grammer production rule 
     |expr '-' expr
     |expr '*' expr
     |expr '/' expr
     |'('expr')'
     |NUMBER
     |ID
     ;
%%

int main()
{
	printf("Enter the expression\n");
	yyparse();
	printf("\nExpression is valid\n");
	exit(0);
}

int yyerror(char *s)
{
	printf("\nExpression is invalid");
	exit(0);
}
int yywrap()
{
	return 1;
}

