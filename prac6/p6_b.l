%{
#include <stdio.h>

int hexToNumber(char str[]){
    int num = 0;
    int i;
    char c;
    for (i = 0; str[i] != '\0'; i++){
        c = str[i];
        if (c >= '0' && c <= '9')
            num = num * 16 + (c - '0');
        else if (c >= 'A' && c <= 'F')
            num = num * 16 + (c - 'A' + 10);
        else if (c >= 'a' && c <= 'f')
            num = num * 16 + (c - 'a' + 10);
    }
    return num;
}
%}
%%
[0-9A-Fa-f]+ {
    int num = hexToNumber(yytext);
    printf("Enter a hexadecimal number: %s\n", yytext);
    printf("Decimal: %d\n", num);
}
%%
int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}
