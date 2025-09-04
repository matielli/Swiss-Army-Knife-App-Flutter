import 'package:flutter/material.dart';

class ConversorMoedasScreen extends StatelessWidget {
  const ConversorMoedasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversor de Moedas")),
      body: const Center(
        child: Text("Conversor de Moedas (API de câmbio em tempo real)"),
      ),
    );
  }
}
