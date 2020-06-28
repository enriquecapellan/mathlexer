package lexers;
import tokens.Tokens;
import static tokens.Tokens.*;
%%
%public
%class Lexer
%type Tokens
white_space=[ ,\t,\r]+
%{
    public String lexeme;
    public int line;
%}
%%
{white_space} {/*Ignore*/}
"//".* {/*Ignore*/}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
[0-9] {return Digito;}
\n {line=yyline; return NewLine;}
([-+]?[0-9]*\.?[0-9]+[\/\+\-\*\^])+([-+]?[0-9]*\.?[0-9]+) {lexeme=yytext(); return Operacion;}
 . {lexeme=yytext(); return ERROR;}