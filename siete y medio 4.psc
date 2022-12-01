// Tirada jugador
Funcion resultado <- tomar_carta ( lista,posicion  Por Referencia)
	Definir resultado Como real
	resultado<-lista[posicion]
	si resultado > 7 Entonces
		resultado=0.5
	FinSi
	Mientras resultado>7 Hacer
		Leer resultado
	FinMientras
	posicion<-posicion+1
	Escribir "La carta tiene una puntuación de: ", resultado
Fin Funcion

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

Funcion tiradajugador (lista, posicion Por Referencia, puntuacion Por Referencia)
	Definir respuesta Como Cadena
	respuesta= ""
	Definir plantado Como Logico
	plantado=Falso
	Mientras puntuacion<7.5 y plantado=Falso Hacer
		puntuacion=puntuacion+tomar_carta(lista,posicion)
		Escribir "Tu puntuación acumulada es: ", puntuacion
		si puntuacion <7.5 Entonces
			Escribir "Te plantas? (S/N)"
			Leer respuesta
			Mientras respuesta<>"S" y respuesta<>"N" Hacer
				Escribir "Lo has escrito mal, te plantas? (S/N)"
				Leer respuesta
			FinMientras
			si respuesta="S" Entonces
			   plantado=Verdadero	
			sino 
				plantado=Falso
			FinSi
		FinSi
	FinMientras
	
	si puntuacion>7.5 Entonces
		Escribir "Haz perdido"
	sino 
		Escribir "Es turno del crupier"
	FinSi
Fin Funcion

Algoritmo siete_y_medio_4
	Definir baraja, i, cartas Como Entero
	Definir puntos Como Real
	Dimension mazo[40]
	i<-0
	cartas<-0
	puntos=0
	Para i<-0 hasta 39 Con Paso 1 Hacer
		mazo[i]=0
	FinPara
	crear_mazo(mazo)
	mezclar_mazo(mazo)
	tiradajugador(mazo,cartas,puntos)
	
	

FinAlgoritmo
