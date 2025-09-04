import 'package:flutter/material.dart';

// Importando todas as telas
import 'calculadora_screen.dart';
import 'conversor_unidades_screen.dart';
import 'lista_tarefas_screen.dart';
import 'notas_screen.dart';
import 'calculadora_imc_screen.dart';
import 'cronometro_temporizador_screen.dart';
import 'gerador_qr_code_screen.dart';
import 'leitor_qr_code_screen.dart';
import 'gerador_senhas_screen.dart';
import 'conversor_moedas_screen.dart';
import 'ferramentas_data_hora_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ferramentas = [
      {"nome": "Calculadora", "tela": const CalculadoraScreen()},
      {"nome": "Conversor de Unidades", "tela": const ConversorUnidadesScreen()},
      {"nome": "Lista de Tarefas", "tela": const ListaTarefasScreen()},
      {"nome": "Bloco de Notas", "tela": const NotasScreen()},
      {"nome": "Calculadora IMC", "tela": const CalculadoraImcScreen()},
      {"nome": "Cronômetro & Temporizador", "tela": const CronometroTemporizadorScreen()},
      {"nome": "Gerador de QR Code", "tela": const GeradorQrCodeScreen()},
      {"nome": "Leitor de QR Code", "tela": const LeitorQrCodeScreen()},
      {"nome": "Gerador de Senhas", "tela": const GeradorSenhasScreen()},
      {"nome": "Conversor de Moedas", "tela": const ConversorMoedasScreen()},
      {"nome": "Ferramentas de Data e Hora", "tela": const FerramentasDataHoraScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Caixa de Ferramentas"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ferramentas.length,
        itemBuilder: (context, index) {
          final item = ferramentas[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(item["nome"] as String),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item["tela"] as Widget),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
