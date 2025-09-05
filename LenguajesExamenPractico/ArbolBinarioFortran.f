      PROGRAM ARBOLBINARIO
      IMPLICIT NONE
      INTEGER, PARAMETER :: MAX_NODOS = 100
      INTEGER DATOS(MAX_NODOS), IZQUIERDO(MAX_NODOS), DERECHO(MAX_NODOS)
      INTEGER RAIZ, CONTADOR
      INTEGER OPCION, DATO

      RAIZ = 0
      CONTADOR = 0
      DATOS = 0
      IZQUIERDO = 0
      DERECHO = 0

      DO
          PRINT *, '=== MENU ARBOL BINARIO ==='
          PRINT *, '1. Insertar nodo'
          PRINT *, '2. Recorrido Preorden'
          PRINT *, '3. Recorrido Inorden'
          PRINT *, '4. Recorrido Postorden'
          PRINT *, '5. Mostrar todos'
          PRINT *, '6. Salir'
          PRINT *, 'Opcion: '
          READ *, OPCION

          IF (OPCION .EQ. 1) THEN
              PRINT *, 'Valor: '
              READ *, DATO
              CALL INSERTAR(DATOS, IZQUIERDO, DERECHO, RAIZ,
     &                      CONTADOR, MAX_NODOS, DATO)
              PRINT *, 'Insertado.'
          ELSE IF (OPCION .EQ. 2) THEN
              IF (RAIZ .EQ. 0) THEN
                  PRINT *, 'Arbol vacio.'
              ELSE
                  PRINT *, 'Preorden: '
                  CALL PREORDEN(DATOS, IZQUIERDO, DERECHO, RAIZ)
                  PRINT *, ''
              END IF
          ELSE IF (OPCION .EQ. 3) THEN
              IF (RAIZ .EQ. 0) THEN
                  PRINT *, 'Arbol vacio.'
              ELSE
                  PRINT *, 'Inorden: '
                  CALL INORDEN(DATOS, IZQUIERDO, DERECHO, RAIZ)
                  PRINT *, ''
              END IF
          ELSE IF (OPCION .EQ. 4) THEN
              IF (RAIZ .EQ. 0) THEN
                  PRINT *, 'Arbol vacio.'
              ELSE
                  PRINT *, 'Postorden: '
                  CALL POSTORDEN(DATOS, IZQUIERDO, DERECHO, RAIZ)
                  PRINT *, ''
              END IF
          ELSE IF (OPCION .EQ. 5) THEN
              IF (RAIZ .EQ. 0) THEN
                  PRINT *, 'Arbol vacio.'
              ELSE
                  PRINT *, 'Preorden: '
                  CALL PREORDEN(DATOS, IZQUIERDO, DERECHO, RAIZ)
                  PRINT *, 'Inorden: '
                  CALL INORDEN(DATOS, IZQUIERDO, DERECHO, RAIZ)
                  PRINT *, 'Postorden: '
                  CALL POSTORDEN(DATOS, IZQUIERDO, DERECHO, RAIZ)
                  PRINT *, ''
              END IF
          ELSE IF (OPCION .EQ. 6) THEN
              PRINT *, 'Adios!'
              EXIT
          ELSE
              PRINT *, 'Opcion invalida.'
          END IF
      END DO
      END

      RECURSIVE SUBROUTINE INSERTARR(DATOS, IZQ, DER, NODO, CONT,
     &                               MAX, VALOR)
      INTEGER DATOS(*), IZQ(*), DER(*), NODO, CONT, MAX, VALOR

      IF (NODO .EQ. 0) THEN
          CONT = CONT + 1
          IF (CONT .GT. MAX) THEN
              PRINT *, 'Error: Arbol lleno'
              RETURN
          END IF
          DATOS(CONT) = VALOR
          IZQ(CONT) = 0
          DER(CONT) = 0
          NODO = CONT
      ELSE IF (VALOR .LT. DATOS(NODO)) THEN
          CALL INSERTARR(DATOS, IZQ, DER, IZQ(NODO), CONT, MAX, VALOR)
      ELSE IF (VALOR .GT. DATOS(NODO)) THEN
          CALL INSERTARR(DATOS, IZQ, DER, DER(NODO), CONT, MAX, VALOR)
      END IF
      END SUBROUTINE INSERTARR

      SUBROUTINE INSERTAR(DATOS, IZQ, DER, RAIZ, CONT, MAX, VALOR)
      INTEGER DATOS(*), IZQ(*), DER(*), RAIZ, CONT, MAX, VALOR
      CALL INSERTARR(DATOS, IZQ, DER, RAIZ, CONT, MAX, VALOR)
      END SUBROUTINE INSERTAR

      RECURSIVE SUBROUTINE PREORDEN(DATOS, IZQ, DER, NODO)
      INTEGER DATOS(*), IZQ(*), DER(*), NODO

      IF (NODO .NE. 0) THEN
          WRITE(*, '(I0, " ")', ADVANCE='NO') DATOS(NODO)
          CALL PREORDEN(DATOS, IZQ, DER, IZQ(NODO))
          CALL PREORDEN(DATOS, IZQ, DER, DER(NODO))
      END IF
      END SUBROUTINE PREORDEN

      RECURSIVE SUBROUTINE INORDEN(DATOS, IZQ, DER, NODO)
      INTEGER DATOS(*), IZQ(*), DER(*), NODO

      IF (NODO .NE. 0) THEN
          CALL INORDEN(DATOS, IZQ, DER, IZQ(NODO))
          WRITE(*, '(I0, " ")', ADVANCE='NO') DATOS(NODO)
          CALL INORDEN(DATOS, IZQ, DER, DER(NODO))
      END IF
      END SUBROUTINE INORDEN

      RECURSIVE SUBROUTINE POSTORDEN(DATOS, IZQ, DER, NODO)
      INTEGER DATOS(*), IZQ(*), DER(*), NODO

      IF (NODO .NE. 0) THEN
          CALL POSTORDEN(DATOS, IZQ, DER, IZQ(NODO))
          CALL POSTORDEN(DATOS, IZQ, DER, DER(NODO))
          WRITE(*, '(I0, " ")', ADVANCE='NO') DATOS(NODO)
      END IF
      END SUBROUTINE POSTORDEN
