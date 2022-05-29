/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigoAnalizador;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Alexander Elias
 */
public class Principal {

    public static void main(String[] args) throws Exception {
        String rutaLexer = "C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/src/codigoAnalizador/Lexer.flex";
        String rutaLexCup = "C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/src/codigoAnalizador/LexerCup.flex";
        String[] rutaSintax = {"-parser", "Sintax", "C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/src/codigoAnalizador/Sintax.cup"};
        generar(rutaLexer, rutaLexCup, rutaSintax);
    }

    public static void generar(String rutaL, String rutaLC, String[] rutaS) throws IOException, Exception {
        File archivo;
        archivo = new File(rutaL);
        JFlex.Main.generate(archivo);
        archivo = new File(rutaLC);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);

        Path rutaSym = Paths.get("C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/src/codigoAnalizador/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/sym.java"),
                Paths.get("C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/src/codigoAnalizador/sym.java")
        );
        Path rutaSin = Paths.get("C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/src/codigoAnalizador/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/Sintax.java"),
                Paths.get("C:/Users/Alexander Elias/Documents/NetBeansProjects/ProyectoFinal/src/codigoAnalizador/Sintax.java")
        );
    }
}
