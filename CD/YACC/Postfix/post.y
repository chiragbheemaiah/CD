%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
%}
%union
{
 int no;
 char str[10];
}
%token<no> DIGIT
%token<str> ID
%left PLUS MINUS
%left MUL DIV
%right EXPO
%left OPEN CLOSE
%%
STMT: EXPR{printf("\n");}
	;
EXPR: EXPR PLUS EXPR{printf("+");}
| EXPR MINUS EXPR{printf("-");}
| EXPR MUL EXPR{printf("*");}
| EXPR DIV EXPR{printf("/");}
| EXPR EXPO EXPR{printf("^");}
| OPEN EXPR CLOSE
| DIGIT{printf("%d",yylval.no);}
| ID{printf("%s",yylval.str);}
;
%%
int main(void)
{
 printf("\n");
 yyparse();
 printf("\n");
 return 0;
}
int yywrap()
{
 return 1;
} 
void yyerror()
{
printf("Error");
}
