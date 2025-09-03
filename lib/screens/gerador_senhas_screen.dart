import 'package:flutter/material.dart';

class GeradorSenhasScreen extends StatelessWidget {
  const GeradorSenhasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gerador de Senhas")),
      body: const Center(
        child: Text("Gerador de Senhas (seguras, com números e caracteres especiais)"),
      ),
    );
  }
}
