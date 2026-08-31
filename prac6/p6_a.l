%{
#include <stdio.h>
int stringToNumber(char str[]){
    int num = 0;
    int i;
    for (i = 0; str[i] != '\0'; i++)
        num = num * 10 + (str[i] - '0');
    return num;
}

void numberToHex(int num){
    char hex[] = "0123456789ABCDEF";
    if (num >= 16)
        numberToHex(num / 16);
    putchar(hex[num % 16]);
}
%}

%%
[0-9]+ {
    int num = stringToNumber(yytext);
    printf("Enter a decimal number: %s\n", yytext);
    printf("Hexadecimal: ");
    numberToHex(num);
    printf("\n");
}
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
