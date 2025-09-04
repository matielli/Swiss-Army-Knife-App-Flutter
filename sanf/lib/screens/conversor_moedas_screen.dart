import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConversorMoedasScreen extends StatefulWidget {
  const ConversorMoedasScreen({super.key});

  @override
  State<ConversorMoedasScreen> createState() => _ConversorMoedasScreenState();
}

class _ConversorMoedasScreenState extends State<ConversorMoedasScreen> {
  final TextEditingController _valorController = TextEditingController();
  String _moedaOrigem = "USD";
  String _moedaDestino = "BRL";
  String _resultado = "";

  final List<String> _moedas = ["USD", "BRL", "EUR", "GBP", "JPY"];

  Future<void> _converter() async {
    final valor = double.tryParse(_valorController.text);
    if (valor == null) {
      setState(() => _resultado = "Digite um valor válido");
      return;
    }

    final url = Uri.parse(
        "https://api.exchangerate.host/latest?base=$_moedaOrigem&symbols=$_moedaDestino");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dados = jsonDecode(response.body);
      final taxa = dados["rates"][_moedaDestino];
      final convertido = valor * taxa;
      setState(() => _resultado = "$valor $_moedaOrigem = $convertido $_moedaDestino");
    } else {
      setState(() => _resultado = "Erro ao buscar taxa de câmbio");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversor de Moedas")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite o valor",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: _moedaOrigem,
                  items: _moedas.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                  onChanged: (val) => setState(() => _moedaOrigem = val!),
                ),
                const Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: _moedaDestino,
                  items: _moedas.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                  onChanged: (val) => setState(() => _moedaDestino = val!),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _converter,
              child: const Text("Converter"),
            ),
            const SizedBox(height: 16),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
