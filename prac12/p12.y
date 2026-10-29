%{
#include <stdio.h>
int yylex(void);
int yyerror(const char *s);
%}
%token INT FLOAT CHAR ID

%%
S : T L ';'
    {
        printf("Valid declaration\n");
    }
    ;
T : INT
  | FLOAT
  | CHAR
  ;
L : L ',' ID
  | ID
  ;

%%

int main()
{
    printf("Enter variable declaration: ");
    yyparse();
    return 0;
}
int yyerror(const char *s)
{
    printf("Invalid declaration\n");
    return 0;
}
