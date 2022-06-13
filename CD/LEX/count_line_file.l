%{
#include<stdio.h>
int char_cnt=0,word_cnt=0,line_cnt=0; 
%}
word [^ \t \n]+
%%
{word} {word_cnt++;char_cnt+=yyleng;}
\n {char_cnt++;line_cnt++;}
. {char_cnt++;}
%%

int main(int argc, char **argv)
{	
	if(argc > 1)
	{
		yyin = fopen(argv[1] , "r");
	}
	else
	{
		return 1;
	}
	yylex();
	fclose(yyin);
	printf("%d %d %d \n",char_cnt,word_cnt,line_cnt); 
	return 0;

}

int yywrap()
{
	return 1;
}
