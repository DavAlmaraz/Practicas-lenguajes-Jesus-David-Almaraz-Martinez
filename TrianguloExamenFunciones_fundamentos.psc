Funcion result <- Triangulo(altura)
	Para i = 1 Hasta altura Con Paso 1 Hacer
		Para j = 1 Hasta (altura - i) Con Paso 1 Hacer
			Escribir Sin Saltar " ";
		Fin Para
		Para x = 1 Hasta (2 * i -1) Con Paso 1 Hacer
			Escribir Sin Saltar x;
		Fin Para
		Escribir " " 
	Fin Para
Fin Funcion

Algoritmo TrianguloExamenFunciones_fundamentos
	Definir altura Como Entero
	Escribir "Ingresa la altura: "
	Leer altura
	Escribir Triangulo(altura)
FinAlgoritmo
