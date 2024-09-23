void main(){
  
  emitNumbers().listen((value){ //Listen method allows Stream to start flowing.
    
    print('From main: $value');
  });
  
}

Stream<int> emitNumbers(){ //Stream es un flujo de datos que puede emitir un valor, muchos valores o ninguno a lo largo del tiempo.
  //Streams para que empiecen a emitir valores debe haber un listener.
  
  return Stream.periodic( const Duration(seconds: 1), (value) {
    return value;
  }).take(5); //take indica la maxima cantidad de emisiones que aceptara del future.
}