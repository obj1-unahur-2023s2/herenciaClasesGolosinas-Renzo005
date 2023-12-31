/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


class Golosina{
	var peso
	var precio
	var sabor
}

/*
 * Golosinas
 */
class Bombon inherits Golosina(peso = 15, precio = 5, sabor = frutilla){
	
	//method precio() { return 5 }
	//method peso() { return 15 }
	method mordisco() { peso = peso * 0.8 - 1 }
	//method sabor() { return frutilla }
	method libreGluten() { return true }
}


class Alfajor inherits Golosina(peso = 15, precio = 12, sabor = chocolate){
	
	//method precio() { return 12 }
	//method peso() { return peso }
	method mordisco() { peso = peso * 0.8 }
	//method sabor() { return chocolate }
	method libreGluten() { return false }
}

class Caramelo inherits Golosina(peso = 5, precio = 12, sabor = frutilla){

	//method precio() { return 12 }
	//method peso() { return peso }
	method mordisco() { peso = peso - 1 }
	//method sabor() { return frutilla }
	method libreGluten() { return true }
}


class Chupetin inherits Golosina(peso = 7, precio = 2, sabor = naranja){
	//var peso = 7
	
	//method precio() { return 2 }
	//method peso() { return peso }
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	//method sabor() { return naranja }
	method libreGluten() { return true }
}

class Oblea inherits Golosina(peso = 250, precio = 5, sabor = vainilla){
	//var peso = 250
	
	//method precio() { return 5 }
	//method peso() { return peso }
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
	//method sabor() { return vainilla }
	method libreGluten() { return false }
}

class Chocolatin inherits Golosina{
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var comido = 0
	
	method pesoInicial(unPeso) { pesoInicial = unPeso }
	method precio() { return pesoInicial * 0.50 }
	method peso() { return (pesoInicial - comido).max(0) }
	method mordisco() { comido = comido + 2 }
	method sabor() { return chocolate }
	method libreGluten() { return false }

}

class GolosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio() + 2 }
	method peso() { return golosinaInterior.peso() + pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() { return golosinaInterior.sabor() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti {
	var libreDeGluten
	var sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	method precio() { return (if(self.libreGluten()) 7 else 10) }
	method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}

class BombonDuro inherits Bombon{
	override method mordisco(){peso = 0.max(peso -1)}	
	method gradoDeDureza(){return 
		if(peso < 12){ 3} 
		else if(peso.between(12,8)){ 2}
		else { 1}
	}
}
