package codigoAnalizador;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "#"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}


/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada ElseIf */
( elseif ) {return new Symbol(sym.ElseIf, yychar, yyline, yytext());}

/* Palabra reservada Then */
( then ) {return new Symbol(sym.Then, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Palabra reservada Set */
( set ) {return new Symbol(sym.Set, yychar, yyline, yytext());}

/* Palabra reservada Puts */
( puts ) {return new Symbol(sym.Puts, yychar, yyline, yytext());}

/* Palabra reservada Expr */
( expr ) {return new Symbol(sym.Expr, yychar, yyline, yytext());}

/* Palabra reservada Proc */
( proc ) {return new Symbol(sym.Procedimiento, yychar, yyline, yytext());}

/* Palabra reservada Return */
( return ) {return new Symbol(sym.Return, yychar, yyline, yytext());}

/* Palabra reservada Break */
( break ) {return new Symbol(sym.Break, yychar, yyline, yytext());}

/* Palabra reservada Continue */
( continue ) {return new Symbol(sym.Continue, yychar, yyline, yytext());}


/* Palabra reservada Switch */
( switch ) {return new Symbol(sym.Switch, yychar, yyline, yytext());}

/* Palabra reservada Default */
( default ) {return new Symbol(sym.Default, yychar, yyline, yytext());}

/* Cadena Literal */
(\"[^\"]*\")|(\"[^\"]*\"(\"[^\"]*\")*)  {return new Symbol(sym.Literal, yychar, yyline, yytext());}

/* Operador Aritmetico */
( "%" | "/" | "*" | "-" | "+") {return new Symbol(sym.Op_aritmetico, yychar, yyline, yytext());} 


/* Signo Interrogacion   */
( "?" ) {return new Symbol(sym.Signo_interrogacion, yychar, yyline, yytext());} 


 /* Operador Exponente */
( "**" ) {return new Symbol(sym.Exponente, yychar, yyline, yytext());}

 /* Operadores relacionales*/
( "<" | ">" | "<>" | "<=" | ">=" | "==" | "!=" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "incr" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

 /* Operadores relacionales para cadenas*/
( "eq"|"ne"|"in" |"ni") {return new Symbol(sym.Op_relacional_cadena, yychar, yyline, yytext());} 

/*Operadores Booleanos*/
(true | false) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}  

/* Operadores logicos */
( "&&" | "||" | "!") {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_apertura, yychar, yyline, yytext());} 

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_cierre, yychar, yyline, yytext());}  

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_apertura, yychar, yyline, yytext());}  

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_cierre, yychar, yyline, yytext());} 

/* Signo de Dolar */
( "$" ) {return new Symbol(sym.Signo_dolar, yychar, yyline, yytext());}  

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}  

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());} 

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}


