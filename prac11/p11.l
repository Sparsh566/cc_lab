%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { yylval.str = strdup(yytext); return NUM; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
[ \t\n]     ;
.           ;
%%

int yywrap()
{
    return 1;
}
