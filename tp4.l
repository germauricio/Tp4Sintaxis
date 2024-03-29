%{
#include "TP4bison.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%


(\+=)										 { strcpy(yylval.cadena, yytext); return MAS_IGUAL;}
(\-=)										 { strcpy(yylval.cadena, yytext); return MENOS_IGUAL;}
(\*=)										 { strcpy(yylval.cadena, yytext); return POR_IGUAL;}
(\/=)										 { strcpy(yylval.cadena, yytext); return DIVIDIDO_IGUAL;}
[0-9]+                                       { yylval.entero = atoi(yytext); return NUM; }
while 										 { strcpy(yylval.cadena, yytext); return WHILE;}
do 											 { strcpy(yylval.cadena, yytext); return DO;}
case										 { strcpy(yylval.cadena, yytext); return CASE;}
break										 { strcpy(yylval.cadena, yytext); return BREAK;}
default										 { strcpy(yylval.cadena, yytext); return DEFAULT;}
for|switch|case|if|else					     { strcpy(yylval.cadena, yytext); return PALABRA_RESERVADA;}
char|int|float|double|void|struct|enum|bool  { strcpy(yylval.cadena, yytext); return TIPO_DATO; }
[a-zA-Z_]([a-zA-Z_]|[0-9])*                  { strcpy(yylval.cadena, yytext); return IDENTIFICADOR; }
(>=)										 { strcpy(yylval.cadena, yytext); return MAYOR_IGUAL;}
(<=)										 { strcpy(yylval.cadena, yytext); return MENOR_IGUAL;}
(==)										 { strcpy(yylval.cadena, yytext); return IGUALDAD;}
(&&)										 { strcpy(yylval.cadena, yytext); return AND;}
(\|\|)										 { strcpy(yylval.cadena, yytext); return OR;}
(\!\=)										 { strcpy(yylval.cadena, yytext); return DESIGUALDAD;}
\"([ -!#-~]|\\\")*\"			 			 { strcpy(yylval.cadena, yytext); return LITERAL_CADENA;}

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
":"		{ return ':'; }

"\n"    { return '\n'; }

%%