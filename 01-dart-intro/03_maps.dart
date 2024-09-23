void main(){
  final Map<String, dynamic> pokemon = {
    
    'name':'Pikachu',
    'hp':100,
    'isAlive': true,
    'abilities': <String>['Thunderbolt'],
    'sprites': <int,String>{
        1: 'pikachu/front.png',
        2: 'pikachu/back.png',
    }
    
  };
  //Dart permite que las llaves no sean siempre strings, lo cual es interesante.
  print(pokemon);
  print('Name: ${pokemon['name']}');
  print('Sprites: ${pokemon['sprites']}');
  print('Back sprite: ${pokemon['sprites'][2]}');
  print('Front sprite: ${pokemon['sprites'][1]}');
  print('Hp: ${pokemon['hp']}');
}
