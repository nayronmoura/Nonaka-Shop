class ItensModel {
  final String name;
  final int quantity;
  final int id;
  int quantitySelected=0;

  ItensModel({required this.name, required this.quantity, required this.id});

  factory ItensModel.fromJson(Map<String, dynamic> json) {
    return ItensModel(
      name: json['itemName'],
      quantity: json['quantity_sold'],
      id: int.parse(json['itemID']),
    );
  }

  void quantitySelectedIncrement(int quantitySelected){
    this.quantitySelected = quantitySelected;
  }

  @override
  String toString(){
    return "name: $name, quantity: $quantity, id: $id, quantitySelected: $quantitySelected";
  }
}
