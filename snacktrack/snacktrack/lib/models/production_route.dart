class ProductionRoute {
  String name;
  String step1;
  String step2;
  String step3;
  List<String> ingredients;
  String estimatedTime;

  ProductionRoute({
    required this.name,
    required this.step1,
    required this.step2,
    required this.step3,
    required this.ingredients,
    required this.estimatedTime,
  });
}