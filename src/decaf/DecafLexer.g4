lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

RESERVA: 'if';

SINAL: ('-'|'+'|'*'|'<'|'<='|'!='|'&&');

INTLARAL : ([a-z]+[A-Z]+[0-9]+);

ID  : (('_')*)('a'..'z'|'A'..'Z')+([0-9]*);

STRINGLITERAL: '\"'(ESC|'\''|[a-zA-Z])+'\"';

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|'\\t'|'\\\\'|[a-zA-Z0-9]) '\'';
STRING : '"' (ESC|'\''|POT|[a-zA-Z]|'\\\\')* '"' ;


fragment
ESC :  '\\' ('\n'|'"');
POT: ('.'|','|'?'|'\\');
