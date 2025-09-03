import 'package:flutter/material.dart';

class ConverterUnidadesScreen extends StatelessWidget {
  const ConverterUnidadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversor de Unidades")),
      body: const Center(
        child: Text("Conversor de Unidades (ex: metros → km, gramas → kg)"),
      ),
    );
  }
}
