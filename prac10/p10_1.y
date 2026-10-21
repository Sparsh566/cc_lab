%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

%token FOR 
%token ID
%token NUMBER
%token LE GE EQ NE

%left '+' '-'
%left '*' '/'

%%

input:
      input line
    |
    ;

line:
      '\n'
    | for_loop '\n'   { printf("Valid FOR Loop\n"); }
    | error '\n'      { printf("Error: Invalid FOR Loop\n"); yyerrok; }
    ;

for_loop:
      FOR '(' initialization ';' condition ';' update ')' statement
    ;

initialization:
      ID '=' expr
    ;

condition:
      expr '<' expr
    | expr '>' expr
    | expr LE expr
    | expr GE expr
    | expr EQ expr
    | expr NE expr
    ;

update:
      ID '=' expr
    ;

statement:
      ';'
    | '{' '}'
    ;

expr:
      ID
    | NUMBER
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    ;

%%
void yyerror(char *s){
    printf("Error: %s\n", s);
}
int main(){
    printf("FOR Loop Parser\n");
    printf("Enter FOR loop:\n");
    yyparse();

    return 0;
}
