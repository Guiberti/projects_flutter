import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/production.dart';
import '../providers/app_provider.dart';
import '../models/production_route.dart';

class CreateRouteScreen extends StatefulWidget {
  @override
  _CreateRouteScreenState createState() => _CreateRouteScreenState();
}

class _CreateRouteScreenState extends State<CreateRouteScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _step1 = '';
  String _step2 = '';
  String _step3 = '';
  List<String> _ingredients = [];
  String _estimatedTime = '';

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Criar novo Roteiro'),
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
                decoration: InputDecoration(labelText: 'Passo 01'),
                onChanged: (value) => _step1 = value,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Passo 02'),
                onChanged: (value) => _step2 = value,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Passo 03'),
                onChanged: (value) => _step3 = value,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              Wrap(
                children: _ingredients.map((ingredient) => Chip(
                  label: Text(ingredient),
                  onDeleted: () {
                    setState(() {
                      _ingredients.remove(ingredient);
                    });
                  },
                )).toList(),
              ),
              DropdownButton<String>(
                hint: Text('Adicionar Ingrediente'),
                items: ['Farinha de Trigo', 'Farinha de Mandioca'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _ingredients.add(value!);
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tempo Estimado'),
                onChanged: (value) => _estimatedTime = value,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final route = ProductionRoute(
                      name: _name,
                      step1: _step1,
                      step2: _step2,
                      step3: _step3,
                      ingredients: _ingredients,
                      estimatedTime: _estimatedTime,
                    );
                    appProvider.addRoute(route);
                    appProvider.addProduction(Production(
                      product: _name,
                      stage: '1/4',
                      estimatedTime: _estimatedTime,
                    ));
                    Navigator.pop(context);
                  }
                },
                child: Text('CRIAR ROTEIRO'),
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