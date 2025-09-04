import 'package:flutter/material.dart';

class ConversorMedidasScreen extends StatefulWidget {
  const ConversorMedidasScreen({super.key});

  @override
  State<ConversorMedidasScreen> createState() => _ConversorMedidasScreenState();
}

class _ConversorMedidasScreenState extends State<ConversorMedidasScreen> {
  final TextEditingController _valorController = TextEditingController();
  String? _tipoSelecionado = 'Polegadas → Centímetros';
  String _resultado = '';

  final List<String> _tipos = [
    'Polegadas → Centímetros',
    'Centímetros → Polegadas',
    'Libras → Quilos',
    'Quilos → Libras',
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
      case 'Polegadas → Centímetros':
        convertido = valor * 2.54;
        unidade = 'cm';
        break;
      case 'Centímetros → Polegadas':
        convertido = valor / 2.54;
        unidade = 'in';
        break;
      case 'Libras → Quilos':
        convertido = valor * 0.453592;
        unidade = 'kg';
        break;
      case 'Quilos → Libras':
        convertido = valor / 0.453592;
        unidade = 'lb';
        break;
    }

    setState(() {
      _resultado = '$valor → $convertido $unidade';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversor de Medidas")),
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
