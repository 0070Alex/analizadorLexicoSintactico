package codigoAnalizador;
import static codigoAnalizador.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "#"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}


/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada ElseIf */
( elseif ) {lexeme=yytext(); return ElseIf;}

/* Palabra reservada Then */
( then ) {lexeme=yytext(); return Then;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Palabra reservada Set */
( set ) {lexeme=yytext(); return Set;}

/* Palabra reservada Puts */
( puts ) {lexeme=yytext(); return Puts;}

/* Palabra reservada Expr */
( expr ) {lexeme=yytext(); return Expr;}

/* Palabra reservada Proc */
( proc ) {lexeme=yytext(); return Procedimiento;}

/* Palabra reservada Return */
( return ) {lexeme=yytext(); return Return;}



/* Palabra reservada Break */
( break ) {lexeme=yytext(); return Break;}

/* Palabra reservada Continue */
( continue ) {lexeme=yytext(); return Continue;}


/* Palabra reservada Switch */
( switch ) {lexeme=yytext(); return Switch;}

/* Palabra reservada Default */
( default ) {lexeme=yytext(); return Default;}


/* Cadena Literal */
(\"[^\"]*\")|(\"[^\"]*\"(\"[^\"]*\")*) {lexeme=yytext(); return Literal;}

/* Operador Aritmetico */
( "%" | "/" | "*" | "-" | "+") {lexeme=yytext(); return Op_aritmetico;}

/* Signo Interrogacion   */
( "?" ) {lexeme=yytext(); return Signo_interrogacion;}

/* Signo Interrogacion   */
( "\\" ) {lexeme=yytext(); return Diagonal_invertida;}

 /* Operador Exponente */
( "**" ) {lexeme=yytext(); return Exponente;}

 /* Operadores relacionales*/
( "<" | ">" | "<>" | "<=" | ">=" | "==" | "!=" ) {lexeme=yytext(); return Op_relacional;}

/* Operadores Incremento y decremento */
( "incr" ) {lexeme = yytext(); return Op_incremento;}

 /* Operadores relacionales para cadenas*/
( "eq"|"ne"|"in" |"ni") {lexeme=yytext(); return Op_relacional_cadena;}

/*Operadores Booleanos*/
(true | false) {lexeme = yytext(); return Op_booleano;}

/* Operadores logicos */
( "&&" | "||" | "!") {lexeme=yytext(); return Op_logico;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_apertura;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_cierre;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_apertura;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_cierre;}

/* Signo de Dolar */
( "$" ) {lexeme=yytext(); return Signo_dolar;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}


