%{
#include "y.tab.h"
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUM; }
[-+*/() \t\n]  { return yytext[0]; }

.   { /* ignore other characters */ }

%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yyparse();
    return 0;
}
