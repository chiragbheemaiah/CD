%{
#include<stdlib.h>
#include<stdio.h>
#include<math.h>
int yylex();
void yyerror(char *);
int flag=0;
%}

%left '='
%left '+'
%left '('
%token INTEGER
%token FLOAT
%token DOUBLE

%%
program: program E '\n' {
	if(flag==0)
	{
		switch($2)
		{
			case 1: printf("Integer\n"); break;
			case 2: printf("Float\n"); break;
			case 3: printf("Double\n"); break;
			case 4: printf("Boolean\n"); break;
		}
 	}
}
	|
	;
E:	INTEGER { $$=1; }
	|	FLOAT { $$=2; }
	|	DOUBLE { $$=3; }
	|	E '+' E {
		if($1==$3)
			$$=$1;
		else
		{
			if(($1==1 && $3==2) || ($1==2 && $3==1))
		 		$$=2;
			else if(($1==3 && $3==2) || ($1==2 && $3==3))
		 		$$=3;
			else
			{
				printf("ERROR: Type mismatch\n");
				flag=1;
			}
		 }
	}
	|	E '=' '=' E { 
	if($1==$4) 
		$$=4;
	else
	{	
		printf("ERROR: Type mismatch\n");
		flag=1;
 	}
	}
	|'(' E ')' { $$=$2; }
	|	
	;	
%%
void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}
int main(void)
{
yyparse();
return 0;
}
