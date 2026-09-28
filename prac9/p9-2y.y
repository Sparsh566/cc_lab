%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex();
void yyerror(char *s);

int calc(int a,char op,int b){
    if((op=='/'||op=='%')&&b==0){
        printf("not possible divide by zero\n");
        return 0;
    }
    switch(op){
        case '+':return a+b;
        case '-':return a-b;
        case '*':return a*b;
        case '/':return a/b;
        case '%':return a%b;
        case '^':return pow(a,b);
    }
    return 0;
}
%}

%token NUMBER INC DEC INVALID
%left '+' '-'
%left '*' '/' '%'
%right '^'

%%
input: input line | ;

line: expr '\n' {printf("Result = %d\n",$1);}
    | INC NUMBER '\n' {printf("Result = %d\n",$2+1);}
    | DEC NUMBER '\n' {printf("Result = %d\n",$2-1);};

expr: NUMBER {$$=$1;}
    | expr '+' expr {$$=calc($1,'+',$3);}
    | expr '-' expr {$$=calc($1,'-',$3);}
    | expr '*' expr {$$=calc($1,'*',$3);}
    | expr '/' expr {$$=calc($1,'/',$3);}
    | expr '%' expr {$$=calc($1,'%',$3);}
    | expr '^' expr {$$=calc($1,'^',$3);}
    | '(' expr ')' {$$=$2;};
%%

void yyerror(char *s){printf("Error: Invalid input\n");}
int main(){return yyparse();}
