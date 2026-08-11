%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char*s);
%}

%token NUM

%%
E:E'+'T|T;
T:T'*'F|F;
F:'('E')'|NUM;
%%

int yyerror(char*s){
	printf("Invalid Expression");
	exit(0);
}

int main(){
	printf("Enter an Expression: ");
	yyparse();
	printf("Valid Expression");
	return 0;
}
