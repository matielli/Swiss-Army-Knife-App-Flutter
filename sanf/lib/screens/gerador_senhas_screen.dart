import 'dart:math';
import 'package:flutter/material.dart';

class GeradorSenhasScreen extends StatefulWidget {
  const GeradorSenhasScreen({super.key});

  @override
  State<GeradorSenhasScreen> createState() => _GeradorSenhasScreenState();
}

class _GeradorSenhasScreenState extends State<GeradorSenhasScreen> {
  int _tamanho = 12;
  bool _usarMaiusculas = true;
  bool _usarMinusculas = true;
  bool _usarNumeros = true;
  bool _usarEspeciais = true;
  String _senhaGerada = "";

  void _gerarSenha() {
    const minusculas = "abcdefghijklmnopqrstuvwxyz";
    const maiusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const numeros = "0123456789";
    const especiais = "@#\$%&*?!";

    String chars = "";
    if (_usarMinusculas) chars += minusculas;
    if (_usarMaiusculas) chars += maiusculas;
    if (_usarNumeros) chars += numeros;
    if (_usarEspeciais) chars += especiais;

    if (chars.isEmpty) {
      setState(() => _senhaGerada = "Selecione ao menos um tipo de caractere.");
      return;
    }

    final rand = Random.secure();
    String senha = List.generate(
      _tamanho,
      (_) => chars[rand.nextInt(chars.length)],
    ).join();

    setState(() => _senhaGerada = senha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gerador de Senhas")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Tamanho: "),
                Expanded(
                  child: Slider(
                    value: _tamanho.toDouble(),
                    min: 4,
                    max: 32,
                    divisions: 28,
                    label: _tamanho.toString(),
                    onChanged: (value) {
                      setState(() => _tamanho = value.toInt());
                    },
                  ),
                ),
              ],
            ),
            CheckboxListTile(
              value: _usarMaiusculas,
              title: const Text("Letras Maiúsculas"),
              onChanged: (val) => setState(() => _usarMaiusculas = val!),
            ),
            CheckboxListTile(
              value: _usarMinusculas,
              title: const Text("Letras Minúsculas"),
              onChanged: (val) => setState(() => _usarMinusculas = val!),
            ),
            CheckboxListTile(
              value: _usarNumeros,
              title: const Text("Números"),
              onChanged: (val) => setState(() => _usarNumeros = val!),
            ),
            CheckboxListTile(
              value: _usarEspeciais,
              title: const Text("Caracteres Especiais"),
              onChanged: (val) => setState(() => _usarEspeciais = val!),
            ),
            ElevatedButton(
              onPressed: _gerarSenha,
              child: const Text("Gerar Senha"),
            ),
            const SizedBox(height: 16),
            SelectableText(
              _senhaGerada,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
