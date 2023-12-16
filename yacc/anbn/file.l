%{
#include "y.tab.h"
%}

%%

a   { return A; }
b   { return B; }

.   { /* ignore other characters */ }

%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yyparse();
    return 0;
}
