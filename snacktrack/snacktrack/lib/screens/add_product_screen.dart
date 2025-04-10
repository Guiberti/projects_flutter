import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/product.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _quantity = 0;
  double _maxQuantity = 0;
  String _validityDate = '';
  double _unitValue = 0;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (value) => _name = value,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantidade Atual'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _quantity = double.parse(value),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantidade Máxima'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _maxQuantity = double.parse(value),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Data de Validade'),
                onChanged: (value) => _validityDate = value,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor Unitário (R\$)'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _unitValue = double.parse(value),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final product = Product(
                      id: DateTime.now().toString(),
                      name: _name,
                      quantity: _quantity,
                      maxQuantity: _maxQuantity,
                      validityDate: _validityDate,
                      unitValue: _unitValue,
                      totalValue: _quantity * _unitValue,
                    );
                    appProvider.addProduct(product);
                    Navigator.pop(context);
                  }
                },
                child: Text('CADASTRAR'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}