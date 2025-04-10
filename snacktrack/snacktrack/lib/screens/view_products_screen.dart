import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/product.dart';

class ViewProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Produtos'),
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
                    DataColumn(label: Text('Produto')),
                    DataColumn(label: Text('Quantidade Atual')),
                    DataColumn(label: Text('Quantidade Máx.')),
                    DataColumn(label: Text('Data de Validade')),
                    DataColumn(label: Text('Valor Unitário')),
                    DataColumn(label: Text('Valor Total')),
                    DataColumn(label: Text('')),
                  ],
                  rows: appProvider.products.map((product) {
                    return DataRow(cells: [
                      DataCell(Text(product.name)),
                      DataCell(Text('${product.quantity} KG')),
                      DataCell(Text('${product.maxQuantity} KG')),
                      DataCell(Text(product.validityDate)),
                      DataCell(Text('R\$ ${product.unitValue.toStringAsFixed(2)}')),
                      DataCell(Text('R\$ ${product.totalValue.toStringAsFixed(2)}')),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Criar controladores para os campos do formulário
                              TextEditingController nameController = TextEditingController(text: product.name);
                              TextEditingController quantityController = TextEditingController(text: product.quantity.toString());
                              TextEditingController maxQuantityController = TextEditingController(text: product.maxQuantity.toString());
                              TextEditingController validityDateController = TextEditingController(text: product.validityDate);
                              TextEditingController unitValueController = TextEditingController(text: product.unitValue.toString());

                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Editar Produto'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(labelText: 'Nome'),
                                          controller: nameController,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(labelText: 'Quantidade Atual'),
                                          controller: quantityController,
                                          keyboardType: TextInputType.number,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(labelText: 'Quantidade Máxima'),
                                          controller: maxQuantityController,
                                          keyboardType: TextInputType.number,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(labelText: 'Data de Validade'),
                                          controller: validityDateController,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(labelText: 'Valor Unitário'),
                                          controller: unitValueController,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Criar um novo objeto Product com os valores atualizados
                                        Product updatedProduct = Product(
                                          id: product.id,
                                          name: nameController.text,
                                          quantity: double.parse(quantityController.text),
                                          maxQuantity: double.parse(maxQuantityController.text),
                                          validityDate: validityDateController.text,
                                          unitValue: double.parse(unitValueController.text),
                                          totalValue: double.parse(quantityController.text) * double.parse(unitValueController.text),
                                        );
                                        appProvider.editProduct(product.id, updatedProduct);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Salvar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancelar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Deseja excluir o item?'),
                                  content: Text('Nome: ${product.name}\nQuantidade Atual: ${product.quantity}'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        appProvider.deleteProduct(product.id);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Excluir'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancelar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      )),
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