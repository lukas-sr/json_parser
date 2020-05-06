
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

/*%token '{' '}' ':' '"' INT FLOAT STR*/

%}
INTEIRO [0-9]+
STRING ["][0-9A-Za-z\ ]+["]

%%

[{] { return '{'; }

[}] { return '}'; }

[:] { return ':'; }

["] { return '"';}

[,] { return ',';}

[\n] { return '\n'; }

{INTEIRO} { return INT; }

{INTEIRO}[.]{INTEIRO} { return FLOAT;}

{STRING} { return STR; }

\[ { return '['; }

\] { return ']'; }

. ;

%%

int yywrap() {
  return 1;
}
