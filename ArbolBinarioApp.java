/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lenguajesexamen;

import java.util.Scanner;

/**
 *
 * @author jesus
 */
class Nodo {
    int dato;
    Nodo izquierdo;
    Nodo derecho;
    
    public Nodo(int dato) {
        this.dato = dato;
        this.izquierdo = null;
        this.derecho = null;
    }
}

class ArbolBinario {
    Nodo raiz;
    
    public ArbolBinario() {
        this.raiz = null;
    }
    
    public void insertar(int dato) {
        raiz = insertarRecursivo(raiz, dato);
    }
    
    private Nodo insertarRecursivo(Nodo actual, int dato) {
        if (actual == null) {
            return new Nodo(dato);
        }
        
        if (dato < actual.dato) {
            actual.izquierdo = insertarRecursivo(actual.izquierdo, dato);
        }
        else if (dato > actual.dato) {
            actual.derecho = insertarRecursivo(actual.derecho, dato);
        }
        else {
            return actual;
        }
        
        return actual;
    }
    
    public void preorden() {
        System.out.print("Preorden: ");
        preordenRecursivo(raiz);
        System.out.println();
    }
    
    private void preordenRecursivo(Nodo nodo) {
        if (nodo != null) {
            System.out.print(nodo.dato + " ");
            preordenRecursivo(nodo.izquierdo);
            preordenRecursivo(nodo.derecho);
        }
    }
    
    public void inorden() {
        System.out.print("Inorden: ");
        inordenRecursivo(raiz);
        System.out.println();
    }
    
    private void inordenRecursivo(Nodo nodo) {
        if (nodo != null) {
            inordenRecursivo(nodo.izquierdo);
            System.out.print(nodo.dato + " ");
            inordenRecursivo(nodo.derecho);
        }
    }
    
    public void postorden() {
        System.out.print("Postorden: ");
        postordenRecursivo(raiz);
        System.out.println();
    }
    
    private void postordenRecursivo(Nodo nodo) {
        if (nodo != null) {
            postordenRecursivo(nodo.izquierdo);
            postordenRecursivo(nodo.derecho);
            System.out.print(nodo.dato + " ");
        }
    }
}

public class ArbolBinarioApp {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        ArbolBinario arbol = new ArbolBinario();
        int opcion, dato;
        
        do {
            System.out.println("\n=== MENU ARBOL BINARIO ===");
            System.out.println("1. Insertar nodo");
            System.out.println("2. Preorden");
            System.out.println("3. Inorden");
            System.out.println("4. Postorden");
            System.out.println("5. Todos");
            System.out.println("6. Salir");
            System.out.print("Opcion: ");
            
            opcion = entrada.nextInt();
            
            switch (opcion) {
                case 1:
                    System.out.print("Valor: ");
                    dato = entrada.nextInt();
                    arbol.insertar(dato);
                    System.out.println("Insertado.");
                    break;
                    
                case 2:
                    if (arbol.raiz == null) {
                        System.out.println("Arbol vacio.");
                    } else {
                        arbol.preorden();
                    }
                    break;
                    
                case 3:
                    if (arbol.raiz == null) {
                        System.out.println("Arbol vacio.");
                    } else {
                        arbol.inorden();
                    }
                    break;
                    
                case 4:
                    if (arbol.raiz == null) {
                        System.out.println("Arbol vacio.");
                    } else {
                        arbol.postorden();
                    }
                    break;
                    
                case 5:
                    if (arbol.raiz == null) {
                        System.out.println("Arbol vacio.");
                    } else {
                        arbol.preorden();
                        arbol.inorden();
                        arbol.postorden();
                    }
                    break;
                    
                case 6:
                    System.out.println("Adios!");
                    break;
                    
                default:
                    System.out.println("Opcion invalida.");
            }
            
        } while (opcion != 6);
    }
}