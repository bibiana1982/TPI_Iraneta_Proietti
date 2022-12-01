Algoritmo PROIETTI_IRAÑETA_TPI
	Escribir "JUEGO TPI"
	Esperar 2 segundos
	Escribir "¡Te invitamos a jugar!"
	Esperar 2 segundos
	Borrar Pantalla
	
	Definir OPCIONELEGIDA como entero
	Repetir
		// Menú con Opcion de Juego (funcion) y de salida
		Limpiar Pantalla
		Escribir "Elige un Juego"
		Esperar 1 segundos
		Escribir "1. Juego del ahorcado"
		Escribir "2. Siete y medio"
		Escribir "3. Salir"
		Esperar 2 segundos
		Escribir "Escribe el Numero del juego que elegiste"
		Leer OPCIONELEGIDA
		Borrar Pantalla
		
		// Mostrar elección del jugador
		Segun OPCIONELEGIDA Hacer
			1:
				Escribir  "Elegiste Juego del ahorcado"
				Esperar 2 Segundos
				Borrar Pantalla
				Juegodelahorcado
				Esperar 1 Segundos
				
			2:
				Escribir "Elegiste Siete y medio"
				Esperar 2 Segundos
				Borrar Pantalla
				Sieteymedio
				Esperar 1 Segundos
				
			3:	
				Escribir "Te esperamos pronto"
				Esperar 2 Segundos
				Borrar Pantalla
			De otro modo:
				Escribir "Opción inválida"
		FinSegun
		Esperar 2 Segundos
	Hasta Que OPCIONELEGIDA=2
FinProceso


// Algoritmo Principal del Juego Siete y medio en forma de Subproceso 
SubProceso Sieteymedio
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
FinSubProceso



// Se crea el mazo
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

// Se mezcla el mazo
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

//Toma la primera carta el jugador

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

//Jugada del jugador

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

//Jugada crupier
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



// Algoritmo Principal del Juego del ahorcadp en forma de Subproceso 
SubProceso Juegodelahorcado
	DEFINIR x,n,a,error Como Entero
	Definir LETRA,SECRETA,VECTOR1,VECTOR2 Como Caracter
	
	Escribir "Me decis que palabra pensaste? "
	Leer SECRETA
	n=Longitud(SECRETA)
	
	SI n>10 Entonces
		Escribir "La palabra debe contener como máximo 10 caracteres"
		Escribir "Me decis otra palabra "
		Leer SECRETA
	FinSi
	Borrar Pantalla
	
	Dimension VECTOR1[n],VECTOR2[n]
	Para x=0 Hasta n-1 Con Paso 1 Hacer
		VECTOR1(x)=SubCadena(SECRETA,x,x)
		VECTOR2(x)="_"
	FinPara
	a=0
	Mientras a<8 Hacer
		para x=0 Hasta n-1 Con Paso 1 Hacer
			Escribir VECTOR2(x) Sin Saltar
		FinPara
		Escribir " "
		Escribir "Proponga una letra "
		Leer LETRA
		
		error=1
		Para x=0 hasta n-1 Con Paso 1 Hacer
			Si LETRA==VECTOR1(x) Entonces
				Si VECTOR2(x)=="_" Entonces
					VECTOR2(X)=LETRA
					error=0	
					c=c+1
				FinSi
			FinSi
		FinPara
		Si c==n Entonces
			Escribir "FELICIDADES, adivinaste la palabra "	
			Mostrar SECRETA		
			a=9
		SiNo
			
			Si error==1 Entonces
				a=a+1
			FinSi
		FinSi
		
		si a == 1 Entonces
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "Seguis en juego, aún te quedan 7 intentos"
		FinSi
		
		si a == 2 Entonces
			Escribir "|------"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "Seguis en juego, aún te quedan 6 intentos"
		FinSi
		
		si a == 3 Entonces
			Escribir "|------"
			Escribir "|     o"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "Seguis en juego, aún te quedan 5 intentos"
		FinSi
		
		si a == 4 Entonces
			Escribir "|----"
			Escribir "|   o"
			Escribir "|   |"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "Seguis en juego, aún te quedan 4 intentos"
		FinSi
		
		si a == 5 Entonces
			Escribir "|----"
			Escribir "|   o"
			Escribir "|   |"
			Escribir "|  /|\"
			Escribir "|"
			Escribir "|"
			Escribir "|"
			Escribir "Seguis en juego, aún te quedan 3 intentos"
		FinSi
		
		si a == 6 Entonces
			Escribir "|----"
			Escribir "|   o"
			Escribir "|   |"
			Escribir "|  /|\"
			Escribir "|   |"
			Escribir "|"
			Escribir "|"
			Escribir "Seguis en juego, aún te quedan 2 intentos"
		FinSi
		
		si a == 7 Entonces
			Escribir "|----"
			Escribir "|   o"
			Escribir "|   |"
			Escribir "|  /|\"
			Escribir "|   |"
			Escribir "|  / \"
			Escribir "|"
			Escribir "Seguis en juego, aún te quedan 1 intentos"
		FinSi
		
		si a == 8 Entonces
			Escribir "|----"
			Escribir "|   o"
			Escribir "|   |"
			Escribir "|  /|\"
			Escribir "|   |"
			Escribir "|  / \"
			Escribir "|AHORCADO|"
			
			Escribir "GAME OVER"
		FinSi
	FinMientras
	
FinSubProceso
	