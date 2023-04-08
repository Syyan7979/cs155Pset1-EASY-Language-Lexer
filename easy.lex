%{
/* Header file inclusion */
#include<stdio.h>
#include<string.h>
%}

/* Token definitions */

%%

go[ \t]+to            { printf("RES_GOTO\n"); }
exit                  { printf("RES_EXIT\n"); }
if                    { printf("RES_IF\n"); }
then                  { printf("RES_THEN\n"); }
else[ \t]+if          { printf("RES_ELSEIF\n"); }
else                  { printf("RES_ELSE\n"); }
case                  { printf("RES_CASE\n"); }
endcase               { printf("RES_ENDCASE\n"); }
while                 { printf("RES_WHILE\n"); }
do                    { printf("RES_DO\n"); }
endwhile              { printf("RES_ENDWHILE\n"); }
repeat                { printf("RES_REPEAT\n"); }
until                 { printf("RES_UNTIL\n"); }
loop                  { printf("RES_LOOP\n"); }
forever               { printf("RES_FOREVER\n"); }
for                   { printf("RES_FOR\n"); }
to                    { printf("RES_TO\n"); }
by                    { printf("RES_BY\n"); }
endfor                { printf("RES_ENDFOR\n"); }
input                 { printf("RES_INPUT\n"); }
output                { printf("RES_OUTPUT\n"); }
array                 { printf("RES_ARRAY\n"); }
node                  { printf("RES_NODE\n"); }
call                  { printf("RES_CALL\n"); }
return                { printf("RES_RETURN\n"); }
stop                  { printf("RES_STOP\n"); }
end                   { printf("RES_END\n"); }
procedure             { printf("RES_PROCEDURE\n"); }
\u2190                { printf("GETS_OP\n"); }
\+                    { printf("PLUS_OP\n"); }
\-                    { printf("MINUS_OP\n"); }
\/                    { printf("DIVIDE_OP\n"); }
\*                    { printf("MULTIPLY_OP\n"); }
\^                    { printf("POWER_OP\n"); }
and                   { printf("LOGICAL_AND_OP\n"); }
or                    { printf("LOGICAL_OR_OP\n"); }
not                   { printf("LOGICAL_NOT_OP\n"); }
\u2264                { printf("LESS_THAN_OR_EQUAL_OP\n"); }
\u2265                { printf("GREATER_THAN_OR_EQUAL_OP\n"); }
<                     { printf("LESS_THAN_OP\n"); }
>                     { printf("GREATER_THAN_OP\n"); }
=                     { printf("EQUALITY_OP\n"); }
\u2260                { printf("INEQUALITY_OP\n"); }
mod                   { printf("MOD_OP\n"); }
log_[0-9]+            { printf("LOG_OP\n"); }
\(                    { printf("PARENTHESIS_OPEN\n"); }
\)                    { printf("PARENTHESIS_CLOSE\n"); }
\[                    { printf("BRACKET_OPEN\n"); }\]                    { printf("BRACKET_CLOSE\n"); }
\{                    { printf("BRACES_OPEN\n"); }
\}                    { printf("BRACES_CLOSE\n"); }
,                     { printf("COMMA\n"); }
:                     { printf("COLON\n"); }
;                     { printf("SEMI_COLON\n"); }
[A-Za-z_][A-Za-z0-9_]*{ printf("IDENTIFIER\n"); }
[0-9]+                { printf("INTEGER_LITERAL\n"); }
[0-9]+\.[0-9]+        { printf("FLOAT_LITERAL\n"); }
[‘]{1}[^’.]*[‘]{1}    { printf("STRING_LITERAL_1\n"); }
[\”]{1}[^\”.]*[\”]{1} { printf("STRING_LITERAL_2\n"); }

%%

int main()
{
yylex(); // Call the lexer function
return 0;
}
