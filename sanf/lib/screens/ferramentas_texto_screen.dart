import 'package:flutter/material.dart';

class FerramentasTextoScreen extends StatefulWidget {
  const FerramentasTextoScreen({super.key});

  @override
  State<FerramentasTextoScreen> createState() => _FerramentasTextoScreenState();
}

class _FerramentasTextoScreenState extends State<FerramentasTextoScreen> {
  final TextEditingController _textoController = TextEditingController();
  String _resultado = '';

  void _contar() {
    final texto = _textoController.text;
    final palavras = texto.trim().isEmpty ? 0 : texto.trim().split(RegExp(r"\s+")).length;
    final caracteres = texto.length;

    setState(() {
      _resultado = "Palavras: $palavras\nCaracteres: $caracteres";
    });
  }

  void _inverter() {
    final texto = _textoController.text;
    setState(() {
      _resultado = texto.split('').reversed.join();
    });
  }

  void _maiusculas() {
    setState(() {
      _resultado = _textoController.text.toUpperCase();
    });
  }

  void _minusculas() {
    setState(() {
      _resultado = _textoController.text.toLowerCase();
    });
  }

  void _removerEspacos() {
    setState(() {
      _resultado = _textoController.text.trim().replaceAll(RegExp(r"\s+"), " ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ferramentas de Texto")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textoController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Digite seu texto",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(onPressed: _contar, child: const Text("Contar")),
                ElevatedButton(onPressed: _inverter, child: const Text("Inverter")),
                ElevatedButton(onPressed: _maiusculas, child: const Text("MAIÚSCULAS")),
                ElevatedButton(onPressed: _minusculas, child: const Text("minúsculas")),
                ElevatedButton(onPressed: _removerEspacos, child: const Text("Remover espaços")),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
