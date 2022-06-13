%{
#include<stdio.h>
int a,b,c;
%}

%%
"a" scanf("%d" , &a);
"b" scanf("%d" , &b);
"c" printf("Sum: %d" , a+b);
%%

int main()
{
	yylex();
	return 0;
}
int yywrap()
{
	return 0;
}
