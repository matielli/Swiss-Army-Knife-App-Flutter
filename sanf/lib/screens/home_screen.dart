import 'package:flutter/material.dart';
import 'converter_unidades_screen.dart';
import 'converter_medidas_screen.dart';
import 'ferramentas_texto_screen.dart';
import 'calculadora_screen.dart';
import 'gerador_senhas_screen.dart';
import 'conversor_moedas_screen.dart';
import 'data_hora_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swiss Army Knife"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu de Ferramentas",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            _drawerItem(context, "Conversor de Unidades", const ConverterUnidadesScreen()),
            _drawerItem(context, "Conversor de Medidas", const ConverterMedidasScreen()),
            _drawerItem(context, "Ferramentas de Texto", const FerramentasTextoScreen()),
            _drawerItem(context, "Calculadora", const CalculadoraScreen()),
            _drawerItem(context, "Gerador de Senhas", const GeradorSenhasScreen()),
            _drawerItem(context, "Conversor de Moedas", const ConversorMoedasScreen()),
            _drawerItem(context, "Data e Hora", const DataHoraScreen()),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Bem-vindo ao Swiss Army Knife!\nEscolha uma ferramenta no menu lateral.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  ListTile _drawerItem(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
    );
  }
}
