class Product {
  String id;
  String name;
  double quantity;
  double maxQuantity;
  String validityDate;
  double unitValue;
  double totalValue;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.maxQuantity,
    required this.validityDate,
    required this.unitValue,
    required this.totalValue,
  });
}