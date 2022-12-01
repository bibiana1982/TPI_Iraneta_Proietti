//Crear Mazo
Funcion crear_mazo ( lista )
	Definir i, cuenta Como Entero
	i=0
	cuenta=1
	para i<-0 Hasta 39 Hacer
		lista[i]=cuenta
		cuenta=cuenta+1
		si cuenta=13 Entonces
			cuenta=1
		FinSi
		si cuenta=8 Entonces
			cuenta=10
			si cuenta=9 Entonces
				cuenta=11
			FinSi
		FinSi
	FinPara
FinFuncion

Algoritmo siete_y_medio_1
	Definir mazo, i Como Entero
	Dimension mazo[40]
	i=0
	Para i<-0 hasta 39 Con Paso 1 Hacer
		mazo[i]=0
	FinPara
	crear_mazo( mazo)
	para i<-0 hasta 39 Con Paso 1 Hacer
		Escribir mazo[i] Sin Saltar " " 
	FinPara

FinAlgoritmo
