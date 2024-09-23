void main() {
  final String pokemon = 'Pikachu';
  final int hp = 100;
  final bool isAlive = true;
  //bool? isAlive; Puede ser null, true o false. En este caso, inicia como null.
  //Dart es meticuloso con null safety.

  //final abilities = <String>['thunderbolt']; //Especifica tipo de dato internamente genericos
  final List<String> abilities = [
    'thunderbolt'
  ]; // Especifica al principio como java
  final sprites = <String>['pikachu/front.png', 'pikachu/back.png'];

  //Tipo de dato dynamic
  //Debemos aprender donde usarlo y donde no.

  // dynamic  == null es null por defecto.
  dynamic errorMsg = 'Hola';
  //Puede cambiar el tipo cualquier cantidad de veces. Pierde las restricciones y null-safety.
  errorMsg = true;
  errorMsg = [1, 2, 3, 4, 5, 6];
  errorMsg = {1, 2, 3, 4, 5, 6};
  errorMsg = null;

  print("""
  
  $pokemon
  Health points: $hp
  Is alive? : $isAlive
  Abilities: $abilities
  Sprites: $sprites
  Error message: $errorMsg
  
  """);
}
