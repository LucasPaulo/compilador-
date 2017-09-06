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

ID  :  ('a'..'z' | 'A'..'Z')+ ;

INTLARAL : '0x'[a-zA-Z0-9]+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|'\\t'|'\\\\'|[a-zA-Z0-9]) '\'';
STRING : '"' (ESC|~'"'|)* '"';


fragment
ESC :  '\\' ('\n'|'"');
