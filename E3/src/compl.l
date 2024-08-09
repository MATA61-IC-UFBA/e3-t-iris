%option noyywrap yylineno
%{
    // noyywrap    - no need to deal with multiple input files
    // yylineno    - variable to track line numbers 
    //               that copies otherwise unmatched input to yyout.

    #include "token.h"

%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
SYMBSIM     (\+|-|\*|\/|%|!|<|>|=|:|;|,|\(|\)|\[|\]|\{|\}|\\)

%%
"//".*                              { }
[ \n\r\t]+                          { }
"array"                             { return ARRAY; }
"boolean"                           { return BOOL; }
"char"                              { return CHAR_KW; }
"else"                              { return ELSE; }
"false"                             { return FALSE; }
"for"                               { return FOR; }
"function"                          { return FUNC; }
"if"                                { return IF; }
"integer"                           { return INT; }
"print"                             { return PRINT; }
"return"                            { return RETRN; }
"string"                            { return STR_KW; }
"true"                              { return TRUE; }
"void"                              { return VOID; }
"while"                             { return WHILE; }
"<="                                { return LEQ; }
">="                                { return GEQ; }
"=="                                { return EQ; }
"!="                                { return NEQ; }
"&&"                                { return AND; }
"||"                                { return OR; }
\'(\\)?.\'                          { return CHAR; }
\".*\"                              { return STR; }
{DIGIT}+                            { return NUM; }
\"([^\"\n\r\t\ ])$                  { return ERROR; }
{SYMBSIM}                           { return yytext[0]; }
{LETTER}(_|{LETTER}|DIGIT){0,255}   { return ID; }
.                                   { return ERROR; }
%%


