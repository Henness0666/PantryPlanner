class FoodItem {
  final int id;
  final String name;
  final int quantity;
  final DateTime expiryDate;

  FoodItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.expiryDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'expiry_date': expiryDate.toIso8601String(),
    };
  }

  // Implement toString to make it easier to see information about
  // each food item when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, quantity: $quantity, expiry_date: $expiryDate}';
  }

  // Add a factory constructor to convert a Map to a FoodItem object
  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      expiryDate: DateTime.parse(map['expiry_date']),
    );
  }
}