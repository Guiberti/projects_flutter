import 'package:flutter/material.dart';
import 'package:horas_v3/services/auth_services.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    FlutterLogo(size: 76),
                    SizedBox(height: 16),
                    TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(hintText: 'Nome'),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      controller: _senhaController,
                      decoration: InputDecoration(hintText: 'Senha'),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      controller: _confirmarSenhaController,
                      decoration: InputDecoration(hintText: 'Confirmar Senha'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_senhaController.text ==
                            _confirmarSenhaController.text) {
                          authService
                              .cadastrarUsuario(
                                email: _emailController.text,
                                senha: _senhaController.text,
                                nome: _nomeController.text,
                              )
                              .then((String? erro) {
                                if (!context.mounted) return;

                                if (erro != null) {
                                  final snackBar = SnackBar(
                                    content: Text(erro),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(snackBar);
                                } else {
                                  Navigator.pop(context);
                                }
                              });
                        } else {
                          const snackBar = SnackBar(
                            content: Text('As senhas não coincidem'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text('Cadastrar'),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
