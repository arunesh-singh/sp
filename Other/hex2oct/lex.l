%{
#include <stdio.h>
%}

%%

[0-7]+  {
            int octal = 0;
            int length = yyleng;
            int i;

            for (i = 0; i < length; i++) {
                octal = (octal << 3) + (yytext[i] - '0');
            }

            if (octal >= 0 && octal <= 15) {
                printf("Octal: %s\tHexadecimal: %X\n", yytext, octal);
            } else {
                printf("Octal number out of range (0-15): %s\n", yytext);
            }
        }

\n      { return 0; }  /* newline terminates the program */

.       { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
