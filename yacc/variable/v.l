%{
#include "y.tab.h"
%}

%%

[a-z]   { yylval = yytext[0]; return LOWERCASE; }
[0-9]   { yylval = yytext[0]; return DIGIT; }

.       { /* ignore other characters */ }

%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yyparse();
    return 0;
}
