class Club{
	var property equipo = null
	var property focoDeLaInstitucion = null // puede ser tradicional, comunitario, o profesional.
	method esEstrella(jugador) 
}
class Equipo{
	var plantel = #{}
	var property capitan = null
	
	method agregarJugador(jugador){
		plantel.add(jugador)
	}
	method removerJugador(jugador){
		plantel.remove(jugador)
		if (jugador == capitan) capitan = null //Tambien podria haber hecho removerCapitan()
	}
	method agregarCapitan(jugador){
		plantel.add(jugador)
		capitan = jugador
	}
}

//plantel => conjunto de jugadores
class Jugador{
	var property 
	var property valorDePase = null
	var property partidosJugadosEnElClub = null
	method esEstrella(){
		if (partidosJugadosEnElClub >= 50){
			true
		}else{
			
		}
	}
}
//Cada actividad (sea un equipo o una actividad social) es evaluada. La evaluación de un club depende de las evaluaciones de sus actividades, 
//las cuales pueden ser modificadas por las sanciones que reciben.

class ActividadSocial{
	var property sociosParticipantes = null //tambien pueden ser jugadores
	var property organizador = null
}

class Socio{
	var property aniosEnInstitucion = 0
	var property club = null
	
	method esEstrella() = aniosEnInstitucion > 20
}














