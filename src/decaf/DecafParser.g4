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

field_decl: (type id | type id SINAL int_literal SINAL ((VIRGULA type id | type id SINAL int_literal SINAL)+)?) FINAL;

method_decl: (type | RESERVA) id SINAL ((type id (VIRGULA type id)+)?) SINAL block; 

block: LCURLY var_decl* statement* RCURLY;

var_decl: type id ((VIRGULA type id)+)? FINAL; 

type: TYPE;

statement: location assign_op expr FINAL | method_call FINAL | RESERVA SINAL expr SINAL block SINAL RESERVA block SINAL | RESERVA SINAL id SINAL expr FINAL expr FINAL block SINAL | RESERVA SINAL expr SINAL FINAL | 
RESERVA FINAL | RESERVA FINAL | block;

assign_op: OP;

method_name: id;

expr: location | method_call | literal | expr bin_op expr | MENOS expr | SINAL expr | SINAL expr SINAL;

callout_arg: expr | string_literal;

string_literal: (STRING)*;

method_call: method_name SINAL expr ((VIRGULA expr)+)? SINAL | CALLOUT SINAL string_literal callout_arg ((VIRGULA callout_arg)+)? SINAL;

location: id | id expr;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: ARITH;

rel_op: REL;

eq_op: REL;

cond_op: COND;

literal: int_literal | char_literal | bool_literal; 

id: ID;

digit: INTLARAL;

hex_digit: digit INTLARAL;

int_literal: decimal_literal | hex_literal;

decimal_literal: digit (digit)*; 

hex_literal: hex_digit (hex_digit) (hex_digit)*;

bool_literal: BOOL;

char_literal: (CHAR)*;
