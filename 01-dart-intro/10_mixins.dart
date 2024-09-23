abstract class Animal{
  
}

abstract class Mamifero extends Animal{}
  
abstract class Ave extends Animal{}

abstract class Pez extends Animal{}

mixin Volador{
  void volar() => print('Estoy volando!');
}

mixin Caminante{
  
  void caminar() => print('Estoy caminando!');
}

mixin Nadador{
  void nadar() => print('Estoy nadando!');
}

//with utiliza mixins
class Gato extends Mamifero with Caminante{
  
}

class Delfin extends Mamifero with Nadador{
  
}

class Murcielago extends Mamifero with Volador, Caminante{
  
}

class Paloma extends Ave with Volador, Caminante{
  
}

class Pato extends Ave with Caminante, Volador, Nadador{
  
}

class Tiburon extends Pez with Nadador{
  
}

class PezVolador extends Pez with Nadador, Volador{
  
}



void main(){
  
  final flipper = Delfin();
  
  flipper.nadar();
  
  final cat = Gato();
  
  cat.caminar();
  
  final pal = Paloma();
  
  pal.caminar();
  pal.volar();
  
  final pat =  Pato();
  pat.caminar();
  pat.nadar();
  pat.volar();
  
}
