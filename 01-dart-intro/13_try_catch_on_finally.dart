void main() async{ //En este caso, se puede por que future resolvera void, no importa el valor del future
  
  print("Inicio del main");
  
  try{
    final value = await httpGet('url'); //Espera el resultado, luego continua la funcion.
    print('Success on request $value');
    
  } on Exception catch(err){ //Errores especificos que se lanzan.
     print('Caught exception $err'); 
  }
  catch (err){ //Errores no controlados
    
    print('OOPS! Something bad happened: $err');
    
  } finally{ //Finally siempre se ejecutara, independiente del try o catch cumplido.
    print('Fin del try/catch'); 
  }
  
  print("Fin del programa");
  
}


Future<String> httpGet(String url) async{ //Async obliga a que esa funcion retorna future. No puede retornar otro valor.
  
  await Future.delayed(const Duration(seconds: 1)); //Espera a que ese future se resuelva
  
  throw Exception('No hay parametros en el URL.');
  
  //return 'Tenemos un valor de la petición.';
  
  
  
}