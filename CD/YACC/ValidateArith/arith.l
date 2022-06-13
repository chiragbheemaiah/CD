%{
#include"y.tab.h"
extern yylval;
%}

%%
[0-9]+ {yylval=atoi(yytext); return NUMBER;} //this is send to the yacc code as token INTEGER
[a-zA-Z]+ {return ID;} //this is send to the yacc code as token  ID
[\t]+ ;
\n {return 0;}
. {return yytext[0];}
%%
