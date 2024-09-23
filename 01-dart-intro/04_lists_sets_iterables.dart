void main(){
  final numbers = [1,2,3,4,5,5,5,6,7,8,9,9,10];
  
  
  print('Original list $numbers');
  print('Non-duplicate list ${numbers.toSet().toList()}');
  print('List length ${numbers.length}');
  print('Index 0: ${numbers[0]}');
  print('First: ${numbers.first}');
  print('Last: ${numbers.last}');
  print('Reversed: ${numbers.reversed}'); //Se convierte en un iterable
  
  final reversedNumbers = numbers.reversed; //Elemento que se puede iterar, leer de manera secuencial
  print('Iterable: $reversedNumbers');
  print('ToList: ${reversedNumbers.toList()}'); // Lista != Iterable
  print("ToSet: ${reversedNumbers.toSet()}"); //Valores del set son unicos.
  
  final numbersGTFive = numbers.where((int num){ // Se debe colocar un tipo de dato en la variable.
    return num > 5; //Where aplica una funcion y retorna los valores que aplican en un iterable.
  });
  
  print('GT 5: $numbersGTFive');
  print('GT 5 Set: $numbersGTFive.toSet()');
}