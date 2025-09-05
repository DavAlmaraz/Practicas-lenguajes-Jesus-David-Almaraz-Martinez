#include <stdio.h>
#include <stdlib.h>

typedef struct Nodo {
    int dato;
    struct Nodo* izquierdo;
    struct Nodo* derecho;
} Nodo;

typedef struct {
    Nodo* raiz;
} ArbolBinario;

Nodo* insertarRecursivo(Nodo* actual, int dato) {
    if (actual == NULL) {
        Nodo* nuevo = (Nodo*)malloc(sizeof(Nodo));
        nuevo->dato = dato;
        nuevo->izquierdo = NULL;
        nuevo->derecho = NULL;
        return nuevo;
    }
    
    if (dato < actual->dato) {
        actual->izquierdo = insertarRecursivo(actual->izquierdo, dato);
    } else if (dato > actual->dato) {
        actual->derecho = insertarRecursivo(actual->derecho, dato);
    }
    
    return actual;
}

void insertar(ArbolBinario* arbol, int dato) {
    arbol->raiz = insertarRecursivo(arbol->raiz, dato);
}

void preorden(Nodo* nodo) {
    if (nodo != NULL) {
        printf("%d ", nodo->dato);
        preorden(nodo->izquierdo);
        preorden(nodo->derecho);
    }
}

void inorden(Nodo* nodo) {
    if (nodo != NULL) {
        inorden(nodo->izquierdo);
        printf("%d ", nodo->dato);
        inorden(nodo->derecho);
    }
}

void postorden(Nodo* nodo) {
    if (nodo != NULL) {
        postorden(nodo->izquierdo);
        postorden(nodo->derecho);
        printf("%d ", nodo->dato);
    }
}

void liberarArbol(Nodo* nodo) {
    if (nodo != NULL) {
        liberarArbol(nodo->izquierdo);
        liberarArbol(nodo->derecho);
        free(nodo);
    }
}

int main() {
    ArbolBinario arbol;
    arbol.raiz = NULL;
    int opcion, dato;
    
    do {
        printf("\n=== MENU ARBOL BINARIO ===\n");
        printf("1. Insertar nodo\n");
        printf("2. Preorden\n");
        printf("3. Inorden\n");
        printf("4. Postorden\n");
        printf("5. Todos\n");
        printf("6. Salir\n");
        printf("Opcion: ");
        scanf("%d", &opcion);
        
        switch(opcion) {
            case 1:
                printf("Valor: ");
                scanf("%d", &dato);
                insertar(&arbol, dato);
                printf("Insertado.\n");
                break;
            case 2:
                if (arbol.raiz == NULL) {
                    printf("Arbol vacio.\n");
                } else {
                    printf("Preorden: ");
                    preorden(arbol.raiz);
                    printf("\n");
                }
                break;
            case 3:
                if (arbol.raiz == NULL) {
                    printf("Arbol vacio.\n");
                } else {
                    printf("Inorden: ");
                    inorden(arbol.raiz);
                    printf("\n");
                }
                break;
            case 4:
                if (arbol.raiz == NULL) {
                    printf("Arbol vacio.\n");
                } else {
                    printf("Postorden: ");
                    postorden(arbol.raiz);
                    printf("\n");
                }
                break;
            case 5:
                if (arbol.raiz == NULL) {
                    printf("Arbol vacio.\n");
                } else {
                    printf("Preorden: ");
                    preorden(arbol.raiz);
                    printf("\nInorden: ");
                    inorden(arbol.raiz);
                    printf("\nPostorden: ");
                    postorden(arbol.raiz);
                    printf("\n");
                }
                break;
            case 6:
                printf("Adios!\n");
                break;
            default:
                printf("Opcion invalida.\n");
        }
    } while (opcion != 6);
    
    liberarArbol(arbol.raiz);
    return 0;
}