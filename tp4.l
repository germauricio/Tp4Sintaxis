%{
#include "TP4bison.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%

for|switch|case|if|else						 { strcpy(yylval.cadena, yytext); return PALABRA_RESERVADA;}
char|int|float|double|void|struct|enum|bool  { strcpy(yylval.cadena, yytext); return TIPO_DATO; }
[a-zA-Z_]([a-zA-Z_]|[0-9])*                  { strcpy(yylval.cadena, yytext); return IDENTIFICADOR; }
[0-9]+                                       { yylval.entero = atoi(yytext); return NUM; }

"="     { return '='; }
","     { return ','; }
";"     { return ';'; }
"+"     { return '+'; }
"-"     { return '-'; }
"*"     { return '*'; }
"/"     { return '/'; }
"%"     { return '%'; }
")"     { return ')'; }
"("     { return '('; }
"{"     { return '{'; }
"}"     { return '}'; }
"["     { return '['; }
"]"     { return ']'; }
"&"     { return '&'; }
"|"     { return '|'; }
"<"     { return '<'; }
">"     { return '>'; }
"!"     { return '!'; }

"\n"    { return '\n'; }

%%