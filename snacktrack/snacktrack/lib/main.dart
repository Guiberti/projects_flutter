import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/view_products_screen.dart';
import 'screens/add_product_screen.dart';
import 'screens/movement_history_screen.dart';
import 'screens/manage_production_screen.dart';
import 'screens/create_route_screen.dart';
import 'providers/app_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        title: 'Snack Track',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/view_products': (context) => ViewProductsScreen(),
          '/add_product': (context) => AddProductScreen(),
          '/movement_history': (context) => MovementHistoryScreen(),
          '/manage_production': (context) => ManageProductionScreen(),
          '/create_route': (context) => CreateRouteScreen(),
        },
      ),
    );
  }
}