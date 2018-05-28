class Club{
	var property equipo = null
	//var property focoDeLaInstitucion = null // puede ser tradicional, comunitario, o profesional.
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


class Jugador{
	var property club = null
	var property valorDePase = null
	var property partidosJugadosEnElClub = null
	var property actividadSocial = #{}
	
	method numeroDeActividades(){
		return actividadSocial.size() + 1 // por el momento solo tiene un solo equipo(activdad deportiva)
	}
	method esEstrella()=  if (partidosJugadosEnElClub >= 50) true else club.esEstrella(self)
	
	
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

class ClubComunitario inherits Club{
	//es estrella si participa en 3 o más actividades del club (deportivas o sociales).
	override method esEstrella(jugador) = jugador.numeroDeActividades() >= 3 
}
class ClubTradicional inherits Club{
	var property valorDePase = null
	//puede ser estrella tanto porque su pase supera el valor configurado o porque participa en 3 o más actividades del club.
	override method esEstrella(jugador) = jugador.numeroDeActividades() >= 3 || jugador.valorDePase() > valorDePase
	
}
class ClubProfesional inherits Club{
	var property valorDePase = null
	override method esEstrella(jugador) = jugador.valorDePase() > valorDePase
}














