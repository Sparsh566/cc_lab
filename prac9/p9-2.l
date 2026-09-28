%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

"++"        {return INC;}
"--"        {return DEC;}
[0-9]+      {yylval=atoi(yytext);return NUMBER;}
[+\-*/%^()] {return yytext[0];}
[ \t]+      ;
\n          {return '\n';}
.           {return INVALID;}

%%

int yywrap(){return 1;}
