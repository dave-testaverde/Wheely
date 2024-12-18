import 'vehicle.dart';

class Cart {
  final String id;
  final Vehicle vehicle;

  final String date;

  final String dateLabel;

  final String slotFrom;
  final String slotTo;

  final String slotLabel;

  final String cost;  

  Cart({required this.date,
        required this.dateLabel,
        required this.slotLabel, 
        required this.slotFrom, 
        required this.slotTo, 
        required this.cost, 
        required this.id, 
        required this.vehicle
  });
}
