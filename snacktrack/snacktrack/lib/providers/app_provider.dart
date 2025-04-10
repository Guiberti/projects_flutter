import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/movement.dart';
import '../models/production.dart';
import '../models/production_route.dart';

class AppProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Movement> _movements = [];
  List<Production> _productions = [];
  List<ProductionRoute> _routes = [];

  List<Product> get products => _products;
  List<Movement> get movements => _movements;
  List<Production> get productions => _productions;
  List<ProductionRoute> get routes => _routes;

  void addProduct(Product product) {
    _products.add(product);
    _movements.add(Movement(
      id: DateTime.now().toString(),
      action: 'Adicionado',
      productName: product.name,
      quantity: product.quantity,
      date: DateTime.now().toString().split(' ')[0],
      time: TimeOfDay.now().format(WidgetsBinding.instance!.window as BuildContext),
    ));
    notifyListeners();
  }

  void editProduct(String id, Product updatedProduct) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = updatedProduct;
      _movements.add(Movement(
        id: DateTime.now().toString(),
        action: 'Alterado',
        productName: updatedProduct.name,
        quantity: updatedProduct.quantity,
        date: DateTime.now().toString().split(' ')[0],
        time: TimeOfDay.now().format(WidgetsBinding.instance!.window as BuildContext),
      ));
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final product = _products.firstWhere((p) => p.id == id);
    _products.removeWhere((p) => p.id == id);
    _movements.add(Movement(
      id: DateTime.now().toString(),
      action: 'Removido',
      productName: product.name,
      quantity: product.quantity,
      date: DateTime.now().toString().split(' ')[0],
      time: TimeOfDay.now().format(WidgetsBinding.instance!.window as BuildContext),
    ));
    notifyListeners();
  }

  void addProduction(Production production) {
    _productions.add(production);
    notifyListeners();
  }

  void addRoute(ProductionRoute route) {
    _routes.add(route);
    notifyListeners();
  }
}