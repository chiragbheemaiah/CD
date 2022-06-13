%{
#include"y.tab.h"
%}
%%
[0-9]+ {yylval.no=atoi(yytext);return(DIGIT); }
[a-z|A-Z][a-z|A-Z|0-9_]* {strcpy(yylval.str,yytext);return (ID);}
"+" {return(PLUS);}
"-" {return(MINUS);}
"*" {return(MUL);}
"/" {return(DIV);}
"^" {return(EXPO);}
"(" {return(OPEN);}
")" {return(CLOSE);}
"\n" {return 0;}
[\t] ;
%%
