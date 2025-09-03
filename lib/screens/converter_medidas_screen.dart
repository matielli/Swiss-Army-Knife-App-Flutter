import 'package:flutter/material.dart';

class ConverterMedidasScreen extends StatelessWidget {
  const ConverterMedidasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversor de Medidas")),
      body: const Center(
        child: Text("Conversor de Medidas (ex: polegadas → cm, libras → kg)"),
      ),
    );
  }
}
