%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>
// #define YYDEBUG 1
%}

%union {
char cadena[30];
int entero;
}

// %verbose

%token <entero> NUM
%token <cadena> IDENTIFICADOR
%token <cadena> TIPO_DATO
%token <cadena> PALABRA_RESERVADA
%token <cadena> DO
%token <cadena> WHILE
%token <cadena> LITERAL_CADENA
%token <cadena> MAYOR_IGUAL
%token <cadena> MENOR_IGUAL
%token <cadena> IGUALDAD
%token <cadena> AND
%token <cadena> OR
%token <cadena> DESIGUALDAD
%token <cadena> CASE
%token <cadena> BREAK
%token <cadena> DEFAULT



%type <cadena> identificadorA
%type <cadena> exp

%% 

input:    /* vacío */
        | input line
;

line:     '\n'
		| listadoDeSentenciasDeDeclaracion '\n'
		| definicionFuncion  '\n'
;



definicionFuncion: sentenciaDeclaracion '{' listadoDeSentencias '}' {printf("Se ha definido una funcion \n");}

listadoDeSentencias: 
			| sentenciaSwitch listadoDeSentencias
			| sentenciaDo listadoDeSentencias
			| sentenciaFor listadoDeSentencias
			| sentenciaWhile listadoDeSentencias
			| sentenciaIfElse listadoDeSentencias
			| listadoDeSentenciasDeDeclaracion listadoDeSentencias

sentenciaDo: DO '{' listadoDeSentencias '}' {printf( "Se ha declarado una sentencia do \n");}

;

sentenciaFor : PALABRA_RESERVADA '(' sentenciaDeclaracion ';' exp ';' identificadorA '+''+' ')' '{' listadoDeSentencias '}' {printf("Se ha declarado una sentencia for\n")}

;


sentenciaIfElse: PALABRA_RESERVADA '(' exp ')' '{' listadoDeSentencias '}' {printf ("Se declaro un if \n");} sentenciaElse
;

sentenciaElse:
			| PALABRA_RESERVADA '{' listadoDeSentencias '}' {printf ("Se declaron un else \n");}

;

sentenciaWhile: WHILE '(' exp ')' '{' listadoDeSentencias '}' {printf ("Se declaro un while \n");}

;

sentenciaSwitch: 
			| PALABRA_RESERVADA '(' exp ')' '{' sentenciaCase '}' {printf ("Se declaro un switch \n");}

;

sentenciaCase: 
			| CASE exp ':' listadoDeSentencias BREAK ';' {printf ("Se declaro un case \n");} 
			|sentenciaCase DEFAULT ':' listadoDeSentencias {printf ("Se declaro el default \n");}

listadoDeSentenciasDeDeclaracion: 
			|sentenciaDeclaracion
			| sentenciaDeclaracion ';' listadoDeSentenciasDeDeclaracion
;

sentenciaDeclaracion: TIPO_DATO listaIdentificadores {printf("Se han declarado variables \n");}
			| TIPO_DATO IDENTIFICADOR '(' listaParametros')'  {printf("Se ha declarado una funcion \n")}
;

listaParametros: parametro
			| parametro ',' listaParametros

;

parametro:  
			| TIPO_DATO IDENTIFICADOR

;

listaIdentificadores: 	  identificadorA
			| identificadorA ',' listaIdentificadores

;

identificadorA:		  IDENTIFICADOR 
			| IDENTIFICADOR '=' NUM {printf("Se asigna al identificador %s el valor %d \n",$1,$3);}
			
;



exp         : NUM 
	 		| LITERAL_CADENA
			| IDENTIFICADOR
			| exp '+' exp
			| exp '-' exp
			| exp '>' exp
			| exp '<' exp
			| exp IGUALDAD exp
			| exp MAYOR_IGUAL exp
			| exp MENOR_IGUAL exp
			| exp DESIGUALDAD exp
			| exp AND exp
			| exp OR exp
			| exp '=' exp
;

%%

main ()
{
// yydebug = 1;
  yyparse ();
}
