void main() async{ //En este caso, se puede por que future resolvera void, no importa el valor del future
  
  print("Inicio del main");
  
  try{
    final value = await httpGet('url'); //Espera el resultado, luego continua la funcion.
    print(value);
    
  } catch (err){
    
    print('Hay un error: $err');
    
  }
  
  print("Fin del programa");
  
}


Future<String> httpGet(String url) async{ //Async obliga a que esa funcion retorna future. No puede retornar otro valor.
  
  await Future.delayed(const Duration(seconds: 1)); //Espera a que ese future se resuelva
  
  throw 'Error en la peticion';
  
  //return 'Tenemos un valor de la petición.';
  
  
  
}