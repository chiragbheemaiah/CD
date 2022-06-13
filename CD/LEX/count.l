%{
#include<stdio.h>
int vow=0,let=0,dig=0;
char a[100];
%}

%%
[aeiouAEIOU] {vow++; let++;}
[0-9] {dig++;}
[a-zA-Z] {let++;}
. {printf("V: %d, L:%d, D:%d", vow, let, dig);}
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
