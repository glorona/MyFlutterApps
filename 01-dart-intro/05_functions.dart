void main(){
  print(greetEveryone());
  
  print('Suma 2 numeros: ${addTwoNumbers(10,20)}');
  print('Suma 3 numeros: ${addThreeNumbers(10,20,30)}');
  
  print(greetPerson(name: 'Gabriel', message:'Hi,')); //Control space to see missing parameters.
}

//Common Function
String greetEveryone(){ //Evitar tipo dynamic, asigna tipos de retorno para evitar errores.
  return 'Hello everyone!';
}

//Lambda function

String greetGabriel() => 'Hello Gabriel!';


int addTwoNumbers(int a, int b){
  return a + b;
}

int addTwoNumbersOptional(int a, [ int? b ]){ //Funcion con params opcional y posicional.
  
  b = b ?? 0; //Si b es nulo, asignalo como 0. Esto pasa por que el parametro b es opcional por lo tanto puede tener potencialmente un valor de nulo. Para evitar estas operaciones inseguras, podemos agregar un valor por defecto en caso de ser null. 
  //Otras formas de hacerlo
  //b ??=0;
  
  return a + b;
}

int addTwoNumbersDefaultParam(int a, [ int b = 0 ]){ //Funcion con params default y posicional.
  

  return a + b;
}

int addThreeNumbers(int a, int b, int c) => a + b + c;


String greetPerson({required String name, String message= 'Hola,'}){ //Funcion con nombres de variables, no posicionales y opcionales.
  //required obliga a mandar el parametro con el nombre proporcionado.
  return '$message $name';
}