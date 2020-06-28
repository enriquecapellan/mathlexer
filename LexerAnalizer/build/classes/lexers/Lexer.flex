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
%}
%%
{white_space} {/*Ignore*/}
"//".* {/*Ignore*/}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
[0-9]+ {return Digito;}
 . {lexeme=yytext(); return ERROR;}