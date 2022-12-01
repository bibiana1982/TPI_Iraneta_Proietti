Algoritmo JUEGO_AHORCADO
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
Fin Algoritmo