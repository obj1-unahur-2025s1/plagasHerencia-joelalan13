import elementos.*
//clase padre que hereda atributos y metodos sera llamada superClase

class Plaga{
    var poblacion
     
    method puedeTransmitirEnfermedad() = poblacion >= 10
    method atacarElemento(unElemento){
        unElemento.recibirAtaque(self)
        poblacion = poblacion + (poblacion*0.1)
    }
}

// las claseHijos dicen de quien son hijos
class Cucarachas inherits Plaga{

    var pesoPromedio

    method daño() =
        poblacion / 2

//sobreescribemetodo con override y  usaremos super()//   
//si contiene un parametro puedeTransmitirEnfermedad(unParametro)
//tendremos que pasarle el parametro a super(unParametro) 

    override method puedeTransmitirEnfermedad() =
        super() &&  poblacion >= 10
    override method atacarElemento(unElemento){
       super(unElemento)
       pesoPromedio = pesoPromedio + 2
    }
}

//como pulga y garrapata comparten metodos ahora podemos hacer garrapatas hereda de pulgas y pulgas hereda de Plaga

class Pulgas inherits Plaga{
    
    method daño() =
        poblacion * 2
    // al ser lo mismo que Plaga lo Borro //
    //method puedeTransmitirEnfermedad() =
    //   poblacion >= 10

}

class Garrapatas inherits Pulgas{
   //heredo todos los metodos de Pulgas
   override method atacarElemento(unElemento){
        unElemento.recibirAtaque(self)
        poblacion = poblacion + (poblacion*0.2)
    }
}

class Mosquitos inherits Plaga{
    
    method daño() =
        poblacion
    override method puedeTransmitirEnfermedad() =
        poblacion % 3 == 0 && super()

}

class Caracoles inherits Plaga{
// podriamos usar override pero que no afecte a la condicion sin usar super()
    override method puedeTransmitirEnfermedad() = clima.llovio()
}

object clima{
    method llovio() = true
}
// si bien daño es polimorfico se usa para cosas distintas entonces no es codigo repetido, por ejemplo var poblacion
//como tambien la condicion de poblacion >= 10
