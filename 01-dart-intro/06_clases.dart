void main(){
  
  final wolverine = Hero(name: 'Logan', power: 'Regeneration');
  
  print(wolverine); //Automaticamente se llama al toString()
  print(wolverine.name);
  print(wolverine.power);
  
}

class Hero{
  
  String name;
  String power;
  
  
  
  //Otra forma de inicializar constructor, similar a las funciones
  Hero({
    required this.name, 
    required this.power
  });
  
  @override
  String toString(){
    return 'Heroe: $name, Poder: $power';
  }
  
  
  //Inicializacion controlada, asegura que los valores no van a ser nulos pero con parametros posicionales
  
  //Hero(String pName, String pPower)
  //  : name=pName,
  //    power=pPower;
  
}