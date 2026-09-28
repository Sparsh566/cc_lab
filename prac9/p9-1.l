%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int calc(int a, char op, int b){
    if ((op=='/' || op=='%') && b==0) {
        printf("not possible divide by zero\n");
        return 0;
    }
    switch(op) {
        case '+': return a+b;
        case '-': return a-b;
        case '*': return a*b;
        case '/': return a/b;
        case '%': return a%b;
        case '^': return pow(a,b);
    }
    return 0;
}
%}
%%

[0-9]+[ \t]*[+\-*/%^][ \t]*[0-9]+ {
    int a,b;
    char op;
    sscanf(yytext,"%d %c %d",&a,&op,&b);
    printf("Result = %d\n",calc(a,op,b));
}

"++"[0-9]+ {
    printf("Result = %d\n",atoi(yytext+2)+1);
}
"--"[0-9]+ {
    printf("Result = %d\n",atoi(yytext+2)-1);
}
[ \t\n]+ ;
. {
    printf("Error: Invalid input\n");
}

%%
int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}

