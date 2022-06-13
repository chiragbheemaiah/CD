%{
#include<stdio.h>
int l=0, w=0, le=0, spl=0;
%}
letters [a-zA-z]
words [' '\t]
lines [\n]
spl [!@#%^&*]
%%
{lines} {l++;w++;}
{words} {w++;}
{spl} {spl++; le++;}
{letters} {le++;}

"$" {printf("Le: %d, Li:%d, W:%d, SPL:%d" , le, l, w+1, spl);}
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
