%{
#include <stdio.h>
%}

%token A B

%%

start: sequence '\n'
      | error '\n' { yyerrok; }

sequence: A B
        {
            printf("Valid string: %s\n", "aabb");
        }
        | A sequence B
        {
            printf("Valid string: %s\n", "a^n b^n");
        }
        ;

%%

int yylex(void) {
    int c = getchar();
    if (c == EOF) return 0;
    if (c == 'a') return A;
    if (c == 'b') return B;
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
