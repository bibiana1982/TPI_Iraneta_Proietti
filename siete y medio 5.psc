// Jugada crupier y juego completo
Funcion resultado <- tomar_carta (lista,posicion Por Referencia)
	Definir resultado Como Real
	resultado <- lista[posicion]
	Si resultado>7 Entonces
		resultado <- 0.5
	FinSi
	Mientras resultado>7 Hacer
		Leer resultado
	FinMientras
	posicion <- posicion+1
	Escribir 'La carta es un: ',resultado
FinFuncion

//Toma la carta el crupier
Funcion resultado <- carta_crupier (lista,posicion Por Referencia,puntos_jugador Por Referencia,puntos_crupier Por Referencia)
	Definir resultado Como Real
	resultado <- lista[posicion]
	Si resultado>7 Entonces
		resultado <- 0.5
	FinSi
	Escribir 'La carta es un: ',resultado
	posicion <- posicion+1
FinFuncion

Funcion mezclar_mazo (lista)
	Definir pazar1,pazar2,m,i Como Entero
	pazar1 <- 0
	pazar2 <- 0
	m <- 0
	i <- 0
	Para i<-0 Hasta 200 Hacer
		pazar1 <- azar(40)
		pazar2 <- azar(40)
		Mientras pazar2=pazar1 Hacer
			pazar2 <- azar(40)
		FinMientras
		m <- lista[pazar2]
		lista[pazar2] <- lista[pazar1]
		lista[pazar1] <- m
	FinPara
FinFuncion

Funcion crear_mazo (lista)
	Definir i,cuenta Como Entero
	i <- 0
	cuenta <- 1
	Para i<-0 Hasta 39 Hacer
		lista[i] <- cuenta
		cuenta <- cuenta+1
		Si cuenta=13 Entonces
			cuenta <- 1
		FinSi
		Si cuenta=8 Entonces
			cuenta <- 10
			Si cuenta=9 Entonces
				cuenta <- 11
			FinSi
		FinSi
	FinPara
FinFuncion

Funcion tiradajugador (lista,posicion Por Referencia,puntuacion Por Referencia)
	Definir respuesta Como Caracter
	respuesta <- ''
	Definir plantado Como Logico
	plantado <- Falso
	Mientras puntuacion<7.5 Y plantado=Falso Hacer
		puntuacion <- puntuacion+tomar_carta(lista,posicion)
		Escribir 'TUS PUNTOS ACUMULADOS SON: ',puntuacion
		Si puntuacion<7.5 Entonces
			Escribir 'Te plantas? (s/n)'
			Leer respuesta
			Mientras respuesta<>"s"  Y respuesta<>"n" Hacer
				Escribir 'Lo has escrito mal, te plantas? (s/n)'
				Leer respuesta
			FinMientras
			Si respuesta='s' Entonces
				plantado <- Verdadero
			SiNo
				plantado <- Falso
			FinSi
		FinSi
	FinMientras
	
	Si puntuacion>7.5 Entonces
		Escribir 'PERDISTE'
		Escribir ' '
	SiNo
		Escribir ' '
		Escribir 'Es turno del crupier'
		Escribir ' '
	FinSi
FinFuncion

Funcion tirada_crupier (lista,posicion Por Referencia,puntos_jugador Por Referencia,puntos_crupier Por Referencia)
	Definir respuesta Como Caracter
	respuesta <- ''
	Definir plantado Como Logico
	plantado <- Falso
	Mientras puntos_crupier<puntos_jugador Hacer
		puntos_crupier <- puntos_crupier+carta_crupier(lista,posicion,puntos_jugador,puntos_crupier)
		Escribir 'LOS PUNTOS DEL CRUPIER SON: ',puntos_crupier
		Esperar 3 Segundos
	FinMientras
	Si puntos_crupier>=puntos_jugador Y puntos_crupier<=7.5 Entonces
		Escribir ' '
		Escribir  'PERDISTE!'
	SiNo
		Escribir ' '
		Escribir 'FELICITACIONES GANASTE! '
	FinSi
FinFuncion

Algoritmo siete_y_medio_5
	Definir i,cartas Como Entero
	Definir puntos,puntos_crupier Como Real
	Dimension mazo[40]
	i <- 0
	cartas <- 0
	puntos <- 0
	puntos_crupier <- 0
	Para i<-0 Hasta 39 Hacer
		mazo[i] <- 0
	FinPara
	crear_mazo(mazo)
	mezclar_mazo(mazo)
	tiradajugador(mazo,cartas,puntos)
	Si puntos<=7.5 Entonces
		tirada_crupier(mazo,cartas,puntos,puntos_crupier)
	FinSi
FinAlgoritmo
