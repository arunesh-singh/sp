%{
#include <stdio.h>
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%

expression:     NUM
            | expression '+' expression
            | expression '-' expression
            | expression '*' expression
            | expression '/' expression
            | '(' expression ')'
            ;

%%

int yylex(void) {
    int c = getchar();
    if (c == EOF) return 0;
    if (c >= '0' && c <= '9') {
        yylval = c - '0';
        return NUM;
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
