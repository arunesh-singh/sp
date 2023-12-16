%{
#include <stdio.h>
%}

%%

[01]+   {
            int binary = 0;
            int length = yyleng;
            int i;

            for (i = 0; i < length; i++) {
                binary = (binary << 1) + (yytext[i] - '0');
            }

            if (binary >= 0 && binary <= 15) {
                printf("Binary: %s\tDecimal: %d\n", yytext, binary);
            } else {
                printf("Binary number out of range (0-15): %s\n", yytext);
            }
        }

\n      { return 0; }  /* newline terminates the program */

.       { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
