import plagas.*

class Hogar{
  var  nivelMugre
  const  confortOfrecido

  method esBueno() =
     nivelMugre / 2 <= confortOfrecido
  method recibirAtaque(plaga){
    nivelMugre = plaga.daño() 
  }
}

class Huerta{
  var produccion
  method esBueno() =
     produccion > nivelMinimoProduccion.valor()
  method recibirAtaque(plaga){
    if(plaga.puedeTransmitirEnfermedad()){
        produccion = ( produccion - (plaga.daño() * 0.1) ) - 10
    }else{
        produccion = produccion - (produccion*0.1)
    }
  }
}

object nivelMinimoProduccion{
  var property valor = 100
}

class Mascota{

  var salud 
  
  method esBueno() =
    salud > 250
  method recibirAtaque(plaga){
      if(plaga.puedeTransmitirEnfermedad()){
          salud = salud - plaga.daño()
      }
  }

}

class Barrio{

    const elementos = []
    method elementoEsBueno(unElemento) = unElemento.esBueno()
    method esCopado() =
      self.elementosBuenos() > self.elementosMalos()
    method elementosBuenos() =
      elementos.count({e => e.esBueno()})

    method elementosMalos() =  
      elementos.count({e => !e.esBueno()})


}

