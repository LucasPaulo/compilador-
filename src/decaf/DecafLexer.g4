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

INTLARAL : ('0x'('a'..'f'|'A'..'F'|'0'..'9')+)? ('0'..'9')*;

STRINGLITERAL: '\"'(ESC|'\''|[a-zA-Z])+'\"';

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|'\\t'|'\\\\'|[a-zA-Z0-9]) '\'';
STRING : '"' (ESC|POT|'a'..'z'|'A'..'Z'|'\\\\'|' ')+ '"' ;

ID  : ('a'..'z'|'A'..'Z'|'_')+([0-9]*);
fragment
ESC :  '\\' ('\n'|'"');
POT: ('.'|','|'?'|'\\'|':'|'\\\'');
