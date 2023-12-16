%{
#include <stdio.h>
%}

%token LOWERCASE LETTER DIGIT

%%

start: variable
     | error '\n' { yyerrok; }

variable: LOWERCASE DIGIT
        {
            printf("Valid variable: %c%c\n", $1, $2);
        }
        ;

%%

int yylex(void) {
    int c = getchar();
    if (c == EOF) return 0;
    if (c >= 'a' && c <= 'z') {
        yylval = c;
        return LOWERCASE;
    } else if (c >= '0' && c <= '9') {
        yylval = c;
        return DIGIT;
    }
    return c;
}

int yyerror(char *msg) {
    printf("Error: %s\n", msg);
    return 0;
}

int main(void) {
    yyparse();
    return 0;
}
