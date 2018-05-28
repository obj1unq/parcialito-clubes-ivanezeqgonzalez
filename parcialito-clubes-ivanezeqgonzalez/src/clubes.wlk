//Un Sistema modela las sanciones y el valor de pase? 
object sistema{
	var property valorDePase = null
	
	method sancionar(clubOActividad){
		clubOActividad.recibirSancion()
	}
	method reanudarActividadSocial(actividad){
		actividad.removerSancion()
	}
	method cantidadDeSanciones(equipo) = equipo.cantidadDeSanciones()
	method actividadEstaSuspendida(actividad) = actividad.suspendido()
	method evaluarActividad(actividad) = actividad.evaluar() //social o deportiva
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
	var property puntosPorSancion = 20
	var property cantidadDeSanciones = 0
	var property campeonatosObtenidos = 0
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
	method evaluar()= {
		5* campeonatosObtenidos + 
		2* plantel.size() + 
		if (capitan.esEstrella()) 5 else 0 -
		puntosPorSancion * cantidadDeSanciones		
	}	
	method equipoEsExperimentado() = plantel.all({j => j.partidosJugados() >= 10 })
	
}
class EquipoDeFutbol inherits Equipo{
	override  puntosPorSancion = 30
	method estrellasDelPlantel() = plantel.sum({j=> j.esEstrella()})
	override method evaluar(){
		return super() + 5* self.estrellasDelPlantel() + if (capitan.esEstrella()) 10 else 0
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

class ActividadSocial{
	var property sociosParticipantes = null //tambien pueden ser jugadores
	var property organizador = null
	var estaSuspendido = false
	method cantidadDeSocios() = sociosParticipantes.size() 
	method recibirSancion(){estaSuspendido = true}
	method removerSancion(){estaSuspendido = false}
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
	override method esEstrella(jugador) = jugador.numeroDeActividades() >= 3 || jugador.valorDePase() > sistema.valorDePase()
	
}
class ClubProfesional inherits Club{
	override method esEstrella(jugador) = jugador.valorDePase() > sistema.valorDePase()
}














