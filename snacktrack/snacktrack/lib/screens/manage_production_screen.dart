import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/production.dart';

class ManageProductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produção'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...appProvider.routes.map((route) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nome do Produto: ${route.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Passo 01: ${route.step1}'),
                      Text('Passo 02: ${route.step2}'),
                      Text('Passo 03: ${route.step3}'),
                      Text('Ingredientes Utilizados: ${route.ingredients.join(', ')}'),
                      Text('Tempo Estimado: ${route.estimatedTime}'),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}