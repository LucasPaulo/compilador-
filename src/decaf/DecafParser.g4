parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: PROGRAM LCURLY field_decl* method_decl* RCURLY;

field_decl: LCURLY (type id | type id (int_literal))+ RCURLY SINAL;

method_decl: (LCURLY type | RESERVA RCURLY id) (LCURLY type id (',' type id)* RCURLY)? block; 

block: LCURLY var_decl* statement* RCURLY;

var_decl: type id+ SINAL; 

type: TYPE;

statement: location assign_op expr SINAL | method_call | RESERVA SINAL expr SINAL block SINAL RESERVA block SINAL | RESERVA SINAL id SINAL expr SINAL expr SINAL block SINAL | RESERVA SINAL expr SINAL SINAL | 
RESERVA SINAL | RESERVA SINAL | block;

assign_op: SINAL | SINAL | SINAL;

method_call: method_name SINAL expr+ SINAL SINAL;

method_name: id;

location: id | id SINAL expr SINAL;

expr: location | method_call | literal | expr bin_op expr | SINAL expr | SINAL expr | SINAL expr SINAL;
callout_arg: expr | string_literal;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: ARITH;

rel_op: SINAL;

eq_op: SINAL;

cond_op: SINAL;

literal: int_literal | char_literal | bool_literal; 

id: alpha (alpha_num)*;

alpha_num: alpha | digit ; 

alpha: BETO;

digit: INTLARAL;

hex_digit: digit INTLARAL;

int_literal: decimal_literal | hex_literal;

decimal_literal: digit (digit)*; 

hex_literal: '0x' hex_digit (hex_digit)*;

bool_literal: BOOL;

char_literal: (CHAR)*;

string_literal: (STRING)*;


