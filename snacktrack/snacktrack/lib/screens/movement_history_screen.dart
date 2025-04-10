import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class MovementHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Movimentações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar Produtos...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Ação')),
                    DataColumn(label: Text('Produto')),
                    DataColumn(label: Text('Quantidade')),
                    DataColumn(label: Text('Data')),
                    DataColumn(label: Text('Horário')),
                  ],
                  rows: appProvider.movements.map((movement) {
                    return DataRow(cells: [
                      DataCell(Text(movement.id)),
                      DataCell(Text(movement.action)),
                      DataCell(Text(movement.productName)),
                      DataCell(Text('${movement.quantity} KG')),
                      DataCell(Text(movement.date)),
                      DataCell(Text(movement.time)),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}