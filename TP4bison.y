%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
//#define YYDEBUG 1
%}

%union {
char cadena[30];
int entero;
int tipo;
float real;
}

//%verbose

%token <entero> NUM
%token <cadena> IDENTIFICADOR
%token <cadena> TIPO_DATO
%token <cadena> PALABRA_RESERVADA

%type <cadena> identificadorA
%type <entero> expresion

%% 

input:    /* vacío */
        | input line
;

line:     '\n'
		| definicionFuncion  '\n'
        | sentenciaDeclaracion ';' '\n'
;

definicionFuncion: sentenciaDeclaracion '{' sentenciaDeclaracion ';' sentenciaIfElse '}' {printf("Se ha definido una funcion \n");}


;
sentenciaDeclaracion: 
			|TIPO_DATO listaIdentificadores {printf("Se han declarado variables \n");}
			| TIPO_DATO IDENTIFICADOR '(' listaParametros')'  {printf("Se ha declarado una funcion \n")}

;

sentenciaIfElse : 
			| PALABRA_RESERVADA '(' IDENTIFICADOR operadorCondicional IDENTIFICADOR ')' '{' TIPO_DATO IDENTIFICADOR '}'

listaParametros: parametro
			| parametro ',' listaParametros

;

parametro: TIPO_DATO IDENTIFICADOR

;

listaIdentificadores: 	  identificadorA
			| identificadorA ',' listaIdentificadores

;

identificadorA:		  IDENTIFICADOR 
			| IDENTIFICADOR '=' expresion {printf("Se asigna al identificador %s el valor %d \n",$1,$3);}
			
;

expresion:   NUM
;

operadorCondicional : '>' 
			|'<' 
			|'=='

%%

main ()
{
//yydebug = 1;
  yyparse ();
}
