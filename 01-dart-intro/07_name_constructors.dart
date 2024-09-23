void main(){
  //Con una peticion de api, tendriamos un json
  
  final Map<String,dynamic> rawJson = {
     'name': 'Spiderman',
     'power': 'Climb walls',
     'isAlive': true
  };
  
  
  //Constructor normal
  final ironman = Hero(
      isAlive: false, //Si trato de usar el resultado del api, podria elevar un null. ['isAlive2'] ?? false,
      power: 'Money',
      name: 'Tony Stark'
  );
  
  
  //Constructor por nombre
  final spiderman = Hero.fromJson(rawJson);
  
  print(ironman);
  print(spiderman);
  
}

class Hero{
  String name;
  String power;
  bool isAlive;
  
  Hero({
    required this.name,
    required this.power,
    required this.isAlive
  });
  
  //Name constructor
  
  Hero.fromJson(Map<String,dynamic> json)
    : name = json['name'] ?? 'No name found', //Dart is case sensitive
      power = json['power'] ?? 'No power found',
      isAlive = json['isAlive'] ?? 'No isAlive found';
      
 
  
  @override
  String toString(){
    return '$name, $power, isAlive: ${isAlive ? 'YES!':'Nope'}';
  }
}