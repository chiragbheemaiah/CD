%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int words=0, letters=0, lines=0;
%}

%%
\n {lines++;}
[\t|" "] {words++;}
[a-zA-Z] {letters++;}
%%
int main(int argc, char **argv)
{	
	if(argc > 1)
	{
		yyin = fopen(argv[1], "r");
	}
	yylex();
	fclose(yyin);
	printf("%d %d %d", words, letters, lines);
	exit(0);
}
int yywrap()
{
	return 1;
}
