package lexers;
import tokens.Tokens;
import static tokens.Tokens.*;
%%
%public
%class ExpresionLexer
%type Tokens
white_space=[ ,\t,\r]+
%{
    public String lexeme;
    public int line;
%}
%%
{white_space} {/*Ignore*/}
"//".* {/*Ignore*/}
([-+]?[0-9]*\.?[0-9]+[\/\+\-\*\^])+([-+]?[0-9]*\.?[0-9]+) {lexeme=yytext(); return Operacion;}
 . {lexeme=yytext(); line=yyline; return ERROR;}