%{
#include<stdio.h>
int count=0;
%}
%%
[Aa][a-zA-Z]* { count++; }
.|\n
%%
int main()
{
printf("Enter a paragraph: ");
yylex();
printf("The no of words starting with A or a: %d\n",count);
return 0;
}
int yywrap()
{
return 1;
}
