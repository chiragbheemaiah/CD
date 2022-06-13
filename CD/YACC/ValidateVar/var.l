%{
#include "y.tab.h"
%}
%%
[a-zA-Z] { return LETTER ;}
[0-9] { return DIGIT ; }
[_] { return UND; }
\n {return 0;}
. {return yytext[0];}
%%
