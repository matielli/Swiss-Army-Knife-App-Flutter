import 'dart:math';
import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final TextEditingController _valor1Controller = TextEditingController();
  final TextEditingController _valor2Controller = TextEditingController();
  String _resultado = '';

  void _calcular(String operacao) {
    final v1 = double.tryParse(_valor1Controller.text);
    final v2 = double.tryParse(_valor2Controller.text);

    if (v1 == null || (v2 == null && ['+', '-', '×', '÷', '^'].contains(operacao))) {
      setState(() => _resultado = "Valores inválidos");
      return;
    }

    double res = 0;

    switch (operacao) {
      case '+':
        res = v1 + v2!;
        break;
      case '-':
        res = v1 - v2!;
        break;
      case '×':
        res = v1 * v2!;
        break;
      case '÷':
        if (v2 == 0) {
          setState(() => _resultado = "Divisão por zero não permitida");
          return;
        }
        res = v1 / v2!;
        break;
      case '^':
        res = pow(v1, v2!).toDouble();
        break;
      case '√':
        res = sqrt(v1);
        break;
      case 'sin':
        res = sin(v1);
        break;
      case 'cos':
        res = cos(v1);
        break;
      case 'tan':
        res = tan(v1);
        break;
    }

    setState(() => _resultado = res.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _valor1Controller,
              decoration: const InputDecoration(
                labelText: "Valor 1",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _valor2Controller,
              decoration: const InputDecoration(
                labelText: "Valor 2 (use apenas nas operações binárias)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(onPressed: () => _calcular('+'), child: const Text("+")),
                ElevatedButton(onPressed: () => _calcular('-'), child: const Text("-")),
                ElevatedButton(onPressed: () => _calcular('×'), child: const Text("×")),
                ElevatedButton(onPressed: () => _calcular('÷'), child: const Text("÷")),
                ElevatedButton(onPressed: () => _calcular('^'), child: const Text("^")),
                ElevatedButton(onPressed: () => _calcular('√'), child: const Text("√")),
                ElevatedButton(onPressed: () => _calcular('sin'), child: const Text("sin")),
                ElevatedButton(onPressed: () => _calcular('cos'), child: const Text("cos")),
                ElevatedButton(onPressed: () => _calcular('tan'), child: const Text("tan")),
              ],
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
