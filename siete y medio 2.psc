//Mezclar el maso

Funcion mezclar_mazo ( lista)
	Definir pazar1,pazar2,m,i Como Entero	
	pazar1=0
	pazar2=0
	m=0
	i=0
	para i<-0 hasta 200 Hacer
		pazar1=azar(40)	
		pazar2=azar(40)
		Mientras pazar2=pazar1 Hacer
			pazar2=azar(40)
		FinMientras
		m=lista[pazar2]
		lista[pazar2]=lista[pazar1]
		lista[pazar1]=m
	FinPara
Fin Funcion

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

	Algoritmo siete_y_medio_2
		Definir mazo, i Como Entero
		Dimension mazo[40]
		i=0
		Para i<-0 hasta 39 Con Paso 1 Hacer
			mazo[i]=0
		FinPara
		crear_mazo( mazo)
		Escribir "Antes de mezclar"
		para i<-0 hasta 39 Con Paso 1 Hacer
			Escribir mazo[i] " " Sin Saltar
		FinPara
		mezclar_mazo( mazo)
		Escribir " "
		Escribir "Despues de mezclar"
		para i<-0 hasta 39 Con Paso 1 Hacer
			Escribir mazo[i] " " Sin Saltar
		FinPara
FinAlgoritmo
