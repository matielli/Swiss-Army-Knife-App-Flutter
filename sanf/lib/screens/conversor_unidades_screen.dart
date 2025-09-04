import 'package:flutter/material.dart';

class ConversorUnidadesScreen extends StatefulWidget {
  const ConversorUnidadesScreen({super.key});

  @override
  State<ConversorUnidadesScreen> createState() => _ConversorUnidadesScreenState();
}

class _ConversorUnidadesScreenState extends State<ConversorUnidadesScreen> {
  final TextEditingController _valorController = TextEditingController();
  String? _tipoSelecionado = 'Comprimento';
  String _resultado = '';

  final List<String> _tipos = [
    'Comprimento',
    'Peso',
    'Temperatura',
  ];

  void _converter() {
    final valor = double.tryParse(_valorController.text);
    if (valor == null) {
      setState(() => _resultado = 'Digite um número válido');
      return;
    }

    double convertido = 0;
    String unidade = '';

    switch (_tipoSelecionado) {
      case 'Comprimento': // metros -> quilômetros
        convertido = valor / 1000;
        unidade = 'km';
        break;
      case 'Peso': // gramas -> quilos
        convertido = valor / 1000;
        unidade = 'kg';
        break;
      case 'Temperatura': // Celsius -> Fahrenheit
        convertido = (valor * 9 / 5) + 32;
        unidade = '°F';
        break;
    }

    setState(() {
      _resultado = '$valor → $convertido $unidade';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversor de Unidades")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _tipoSelecionado,
              items: _tipos.map((tipo) {
                return DropdownMenuItem(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _tipoSelecionado = value;
                });
              },
            ),
            TextField(
              controller: _valorController,
              decoration: const InputDecoration(
                labelText: "Digite o valor",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _converter,
              child: const Text("Converter"),
            ),
            const SizedBox(height: 16),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
