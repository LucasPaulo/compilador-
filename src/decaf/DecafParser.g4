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

field_decl: LCURLY (type id | type id int_literal (type id | type id int_literal VIRGULA int_literal)*) RCURLY FINAL;

method_decl: (LCURLY type | RESERVA RCURLY id) (LCURLY type id ((VIRGULA type id)+)? RCURLY)? block; 

block: LCURLY var_decl* statement* RCURLY;

var_decl: type id ((VIRGULA type id)+)? FINAL; 

type: TYPE;

statement: location assign_op expr FINAL | method_call | RESERVA SINAL expr SINAL block SINAL RESERVA block FINAL | RESERVA SINAL id SINAL expr SINAL expr SINAL block FINAL | RESERVA SINAL expr SINAL FINAL | 
RESERVA FINAL | RESERVA FINAL | block;

assign_op: OP;

method_name: id;

expr: location | method_call | literal | expr bin_op expr | ARITH expr | SINAL expr | SINAL expr SINAL;

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

id: alpha (alpha_num)*;

alpha_num: alpha | digit ; 

alpha: BETO;

digit: INTLARAL;

hex_digit: digit INTLARAL;

int_literal: decimal_literal | hex_literal;

decimal_literal: digit (digit)*; 

hex_literal: hex_digit (hex_digit) (hex_digit)*;

bool_literal: BOOL;

char_literal: (CHAR)*;


