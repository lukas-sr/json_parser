%{

#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);
int yylex(void);

%}

%token '{' '}' '[' ']' ':' '"' ',' ' ' '\n'  INT FLOAT STR

%%
S:
   S P '\n'{ printf("VALIDO\n");}
   |
   ;

P:
   '{' C '}' {}
   ; 

L:
   '[' C ']' {}
   ;

C:
   A ':' A {}
   |A ',' A {}
   ;

A:
   INT {}
   |FLOAT {}
   |STR {}
   |'"' A '"' {}
   |A ':' A {}
   |A '\n' {}
   |L {}
   |P {}
   ;

%%

void yyerror(char *s) {
   printf("INVALIDO\n");
}

int main() {
   yyparse();
   return 0;
}
