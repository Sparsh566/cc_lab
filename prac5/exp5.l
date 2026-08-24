%{
#include <stdio.h>

char changeCase(char c)
{
    if (c >= 'A' && c <= 'Z')
        return c + ('a' - 'A');
    else
        return c - ('a' - 'A');
}
%}

%%
[a-zA-Z] { putchar(changeCase(yytext[0])); }
.        { printf(" Invalid character: %s", yytext); }
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
