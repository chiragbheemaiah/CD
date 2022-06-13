%{
#include<stdio.h>
#include<stdlib.h>
%}

%token DIGIT LETTER UND
%%
stmt : variable
 ;

variable : LETTER alphanumeric
 ;
alphanumeric: LETTER alphanumeric
 | DIGIT alphanumeric
 | UND alphanumeric
 | LETTER
 | DIGIT
 | UND
 |
 ;
%%
int yyerror(char *msg)
{
 printf("Invalid Expression\n");
 exit(0);
}
int main ()
{
 printf("Enter the variable name\n");
 yyparse();
 printf("Valid Expression\n");
} 
int yywrap()
{
	return 0;
}
