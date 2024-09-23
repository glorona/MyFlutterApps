void main(){
  
  emitNumber().listen((value){
      print('Stream value: $value');
  });
  
}

//async* indica que va a regresar un stream.


Stream<int> emitNumber() async* {// Por que no hay ningun error?
  
  final valuesToEmit = [1,2,3,4,5];
  
  
  for(int i in valuesToEmit){
    await Future.delayed(const Duration(seconds:1));
    yield i; //Ceder un valor, ten este valor de momento.
  }
  
}