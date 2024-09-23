void main(){
  
  final windPlant = WindPlant(initialEnergy: 100);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);
  
  print(windPlant);
  
  print('wind: ${chargePhone(windPlant)}');
  print('nuclear: ${chargePhone(nuclearPlant)}');
}


double chargePhone( EnergyPlant plant){
  if (plant.energyLeft < 10){
    throw Exception('Not enough energy');
  } //Applying Dependency inversion principle
  
  return plant.energyLeft - 10;
}

enum PlantType{ nuclear,wind,water} //Los enums no terminan con punto y coma




abstract class EnergyPlant { //No puede ser instanciada.
  
    double energyLeft;
    final PlantType type; // nuclear, wind, water. Esto no va cambiar, por lo tanto es final.
  
    EnergyPlant({
      required this.energyLeft, 
      required this.type
    });
  
  
    void consumeEnergy( double amount ){
      throw UnimplementedError();
    }
    
}

//extends o implements 
class WindPlant extends EnergyPlant{ //Extends herda todo!
  
  WindPlant({ required double initialEnergy })
    : super(energyLeft: initialEnergy, type:PlantType.wind);
  
  @override
  void consumeEnergy(double amount){
    energyLeft -= amount;
  }
  
  

}

//implement

//La implementacion sirve para usar una funcion especifica o varias funciones de la clase que se referencia
class NuclearPlant implements EnergyPlant{ //La implementacion nos ayuda a colocar explicitamente cada uno de sus overrides.
  @override
  double energyLeft;
  
  @override
  final PlantType type = PlantType.nuclear;
  
  NuclearPlant({required this.energyLeft});
  
  @override
  void consumeEnergy(double amount){
    energyLeft -= (amount*0.5);
  }
  
}