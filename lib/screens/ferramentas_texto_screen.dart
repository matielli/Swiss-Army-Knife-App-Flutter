import 'package:flutter/material.dart';

class FerramentasTextoScreen extends StatelessWidget {
  const FerramentasTextoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ferramentas de Texto")),
      body: const Center(
        child: Text("Ferramentas de Texto (contar caracteres, inverter texto, etc.)"),
      ),
    );
  }
}
