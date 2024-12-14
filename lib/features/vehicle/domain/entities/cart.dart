import 'vehicle.dart';

class Cart {
  final String id;
  final Vehicle vehicle;

  final String slotFrom;
  final String slotTo;

  final String slotLabel;

  final String cost;  

  Cart({required this.slotLabel, 
        required this.slotFrom, 
        required this.slotTo, 
        required this.cost, 
        required this.id, 
        required this.vehicle
  });
}