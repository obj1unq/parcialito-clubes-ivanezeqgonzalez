//Un Sistema modela las sanciones y el valor de pase? 
object sistema{
	
	
}



class Club{
	var property equipo = null
	var property actividades = #{}
	
	method agregrarActividades(actividad){actividades.add(actividad)}
	method removerActividades(actividad){actividades.remove(actividad)}
	method esEstrella(jugador)
	method recibirSancion(){
		if (self.cantidadDeSocios() > 500){
			actividades.forEach({actividad => actividad.suspenderActividad()})
		}else{
			actividades.anyOne().suspenderActividad()
		}
	}
	method retirarSancion(){
		actividades.forEach({actividad => actividad.reanudarActividad()})
	}
	method cantidadDeSocios() = actividades.sum({a => a.cantidadDeSocios()})
}
class Equipo{
	var property cantidadDeSanciones = 0
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
	method suspender
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
	var estaSuspendido = false
	method cantidadDeSocios() = sociosParticipantes.size() 
	method suspenderActividad(){estaSuspendido = true}
	method reanudarActividad(){estaSuspendido = false}
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














