class AppFactory {

  static List<Map<String, dynamic>> slots = [];

  static List<Map<String, dynamic>> genSlotsMock(DateTime date){
    return [
      {'value': 1, 'from': '13:30', 'to' : '14:30', 'date' : date },
      {'value': 2, 'from': '14:30', 'to' : '15:30', 'date' : date },
      {'value': 3, 'from': '15:30', 'to' : '16:30', 'date' : date },
      {'label': 'Select day', 'value': 0}
    ];
  }

  static init(){
    AppFactory.slots = AppFactory.genSlotsMock(DateTime.now());
  }
}