import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/converter_unidades_screen.dart';
import 'screens/converter_medidas_screen.dart';
import 'screens/ferramentas_texto_screen.dart';
import 'screens/calculadora_screen.dart';
import 'screens/gerador_senhas_screen.dart';
import 'screens/conversor_moedas_screen.dart';
import 'screens/data_hora_screen.dart';

void main() {
  runApp(const SwissArmyKnifeApp());
}

class SwissArmyKnifeApp extends StatelessWidget {
  const SwissArmyKnifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiss Army Knife',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
