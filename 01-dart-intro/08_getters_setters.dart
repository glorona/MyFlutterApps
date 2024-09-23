void main(){
  
  final mySquare = Square(side: -10); // Si se inicializa con un valor negativo, el set no hara el trabajo de lanzar la excepcion.
  //Para esto se usan los assert.
  
  
  //mySquare.side = -5; //Deberia dar error por condicion en el setter.
  //mySquare.side = 5;
  
  
  print('Area: ${mySquare.calculateArea()}');
  print('Area: ${mySquare.area}'); //Otra forma de obtener propiedad con un getter
  
  
}


class Square {
  
  double _side; //side * side // _side modificador de acceso privado.
  
  Square({ required double side })
    : assert(side >= 0, 'Side must be greater or equal to zero.'),
     _side = side;
  
  double get area{
      return _side * _side; 
  }
  
  set side(double value){
    print('setting new value $value');
    if ( value < 0) throw 'Value must be greater than 0.';
    
    _side = value;
    
  }
  
  double calculateArea(){
    return _side*_side;
  }
}