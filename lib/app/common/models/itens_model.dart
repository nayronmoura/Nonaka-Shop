class ItensModel {
  String name;
  int quantity;
  int id;

  ItensModel({required this.name, required this.quantity, required this.id});

  factory ItensModel.fromJson(Map<String, dynamic> json) {
    return ItensModel(
      name: json['name'],
      quantity: json['quantity'],
      id: json['id'],
    );
  }
}
