%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+*]        { return yytext[0]; }
[ \t]       { ; }
\n          { return '\n'; }
.           { printf("Invalid Expression %s\n", yytext); }

%%

int yywrap()
{
    return 1;
}
