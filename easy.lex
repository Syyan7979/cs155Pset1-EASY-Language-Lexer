%{
/* Header file inclusion */
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
char *strip_white_space(char *str);
%}

/* Token definitions */
DIGIT [0-9]+
ID [A-Za-z_][A-Za-z0-9_]*

%%
"go"[\ \t\n]+("to") { ret_print("RES_GOTO"); }
"exit" { ret_print("RES_EXIT"); }
"if" { ret_print("RES_IF"); }
"then" { ret_print("RES_THEN"); }
"else"[\ \t\n]+("if") { ret_print("RES_ELSEIF"); }
"else" { ret_print("RES_ELSE"); }
"case" { ret_print("RES_CASE"); }
"endcase" { ret_print("RES_ENDCASE"); }
"while" { ret_print("RES_WHILE"); }
"do" { ret_print("RES_DO"); }
"endwhile" { ret_print("RES_ENDWHILE"); }
"repeat" { ret_print("RES_REPEAT"); }
"until" { ret_print("RES_UNTIL"); }
"loop" { ret_print("RES_LOOP"); }
"forever" { ret_print("RES_FOREVER"); }
"for" { ret_print("RES_FOR"); }
"to" { ret_print("RES_TO"); }
"by" { ret_print("RES_BY"); }
"endfor" { ret_print("RES_ENDFOR"); }
"input" { ret_print("RES_INPUT"); }
"output" { ret_print("RES_OUTPUT"); }
"array" { ret_print("RES_ARRAY"); }
"node" { ret_print("RES_NODE"); }
"call" { ret_print("RES_CALL"); }
"return" { ret_print("RES_RETURN"); }
"stop" { ret_print("RES_STOP"); }
"end" { ret_print("RES_END"); }
"procedure" { ret_print("RES_PROCEDURE"); }
"==" { ret_print("EQUALITY_OP"); }
"=" { ret_print("GETS_OP"); }
"+" { ret_print("PLUS_OP"); }
"-" { ret_print("MINUS_OP"); }
"/" { ret_print("DIVIDE_OP"); }
"*" { ret_print("MULTIPLY_OP"); }
"^" { ret_print("POWER_OP"); }
"and" { ret_print("LOGICAL_AND_OP"); }
"or" { ret_print("LOGICAL_OR_OP"); }
"not" { ret_print("LOGICAL_NOT_OP"); }
"<=" { ret_print("LESS_THAN_OR_EQUAL_OP"); }
">=" { ret_print("GREATER_THAN_OR_EQUAL_OP"); }
"<" { ret_print("LESS_THAN_OP"); }
">" { ret_print("GREATER_THAN_OP"); }
"!=" { ret_print("iNEQUALITY_OP"); }
"mod" { ret_print("MOD_OP"); }
"log_"[0-9]+ { ret_print("LOG_OP"); }
"(" { ret_print("PARENTHESIS_OPEN"); }
")" { ret_print("PARENTHESIS_CLOSE"); }
"[" { ret_print("BRACKET_OPEN"); }
"]" { ret_print("BRACKET_CLOSE"); }
"{" { ret_print("BRACES_OPEN"); }
"}" { ret_print("BRACES_CLOSE"); }
"," { ret_print("COMMA"); }
":" { ret_print("COLON"); }
";" { ret_print("SEMICOLON"); }
[a-zA-Z_][a-zA-Z0-9_]* { ret_print("IDENTIFIER"); }
[0-9]+[.][0-9]+ { ret_print("FLOAT_LITERAL"); }
[0-9]+ { ret_print("INTEGER_LITERAL"); }
[']{1}[^'.]*[']{1} { ret_print("STRING_LITERAL_1"); }
[\"]{1}[^\".]*[\"]{1} { ret_print("STRING_LITERAL_2"); }
"//".* { ret_print("COMMENT"); }
[ \t\r\f] { /* ignore white space */ }
. { yyerror("Invalid token"); }
"\n" { lineno++; }
%%

void ret_print(char *token_type)
{
    printf("%s(\"%s\")\n", token_type, strip_white_space(yytext));
}

void yyerror(char *message)
{
    printf("Error: \"%s\" at line %d. Token = %s\n", message, lineno, yytext);
    exit(1);
}

char *strip_white_space(char *str) {
    int str_len = strlen(str);

    while(isspace(str[str_len - 1])) {
        str_len--;
    }

    str[str_len] = '\0';

    return str;
}

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}
