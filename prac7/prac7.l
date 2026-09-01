%{
#include <stdio.h>
%}

%%
.*com$      { printf("Ends with com\n"); }
.*          { printf("Does not end with com\n"); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter lines:\n");
    yylex();
    return 0;
}

