import 'package:flutter/material.dart';

class DataHoraScreen extends StatelessWidget {
  const DataHoraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ferramentas de Data e Hora")),
      body: const Center(
        child: Text("Ferramentas de Data/Hora (fuso horário, diferença entre datas, cronômetro)"),
      ),
    );
  }
}
