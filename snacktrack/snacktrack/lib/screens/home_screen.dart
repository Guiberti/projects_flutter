import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Início | Visão Geral'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Snack Track'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.visibility),
              title: Text('Ver Produtos'),
              onTap: () {
                Navigator.pushNamed(context, '/view_products');
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Cadastrar Produtos'),
              onTap: () {
                Navigator.pushNamed(context, '/add_product');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Histórico de Movimentação'),
              onTap: () {
                Navigator.pushNamed(context, '/movement_history');
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Gerenciar Produção'),
              onTap: () {
                Navigator.pushNamed(context, '/manage_production');
              },
            ),
            ListTile(
              leading: Icon(Icons.route),
              title: Text('Criar Roteiro de Produção'),
              onTap: () {
                Navigator.pushNamed(context, '/create_route');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seu Estoque de Produtos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Produto'),
                      Text('Quantidade'),
                      Text('Valor Total'),
                    ],
                  ),
                  Divider(),
                  ...appProvider.products.map((product) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name),
                      Text('${product.quantity} KG'),
                      Text('R\$ ${product.totalValue.toStringAsFixed(2)}'),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sua Produção',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Produto'),
                      Text('Etapa'),
                      Text('Tempo Estimado'),
                    ],
                  ),
                  Divider(),
                  ...appProvider.productions.map((production) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(production.product),
                      Text(production.stage),
                      Text(production.estimatedTime),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}