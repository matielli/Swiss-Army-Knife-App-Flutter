import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FerramentasDataHoraScreen extends StatefulWidget {
  const FerramentasDataHoraScreen({super.key});

  @override
  State<FerramentasDataHoraScreen> createState() =>
      _FerramentasDataHoraScreenState();
}

class _FerramentasDataHoraScreenState extends State<FerramentasDataHoraScreen> {
  DateTime? _data1;
  DateTime? _data2;
  String _resultadoDatas = "";

  Stopwatch _cronometro = Stopwatch();
  late final _cronometroTicker = Stream.periodic(const Duration(seconds: 1));

  int _tempoRestante = 0;
  bool _temporizadorAtivo = false;

  Future<void> _selecionarData1() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (data != null) {
      setState(() => _data1 = data);
    }
  }

  Future<void> _selecionarData2() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (data != null) {
      setState(() => _data2 = data);
    }
  }

  void _calcularDiferenca() {
    if (_data1 == null || _data2 == null) {
      setState(() => _resultadoDatas = "Selecione as duas datas");
      return;
    }
    final diff = _data2!.difference(_data1!).inDays;
    setState(() => _resultadoDatas = "Diferença: $diff dias");
  }

  void _iniciarCronometro() {
    setState(() => _cronometro.start());
  }

  void _pararCronometro() {
    setState(() => _cronometro.stop());
  }

  void _resetarCronometro() {
    setState(() => _cronometro.reset());
  }

  void _iniciarTemporizador(int segundos) {
    setState(() {
      _tempoRestante = segundos;
      _temporizadorAtivo = true;
    });

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (_tempoRestante > 0 && _temporizadorAtivo) {
        setState(() => _tempoRestante--);
        return true;
      }
      return false;
    });
  }

  void _pararTemporizador() {
    setState(() => _temporizadorAtivo = false);
  }

  @override
  Widget build(BuildContext context) {
    final formato = DateFormat("dd/MM/yyyy");

    return Scaffold(
      appBar: AppBar(title: const Text("Ferramentas de Data e Hora")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Diferença entre Datas", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                ElevatedButton(onPressed: _selecionarData1, child: const Text("Selecionar Data 1")),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _selecionarData2, child: const Text("Selecionar Data 2")),
              ],
            ),
            Text("Data 1: ${_data1 != null ? formato.format(_data1!) : '-'}"),
            Text("Data 2: ${_data2 != null ? formato.format(_data2!) : '-'}"),
            ElevatedButton(onPressed: _calcularDiferenca, child: const Text("Calcular Diferença")),
            Text(_resultadoDatas),

            const Divider(height: 32),
            const Text("Cronômetro", style: TextStyle(fontWeight: FontWeight.bold)),
            StreamBuilder(
              stream: _cronometroTicker,
              builder: (context, snapshot) {
                final tempo = _cronometro.elapsed;
                final horas = tempo.inHours;
                final minutos = tempo.inMinutes % 60;
                final segundos = tempo.inSeconds % 60;
                return Text("$horas:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}",
                    style: const TextStyle(fontSize: 24));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _iniciarCronometro, child: const Text("Iniciar")),
                ElevatedButton(onPressed: _pararCronometro, child: const Text("Parar")),
                ElevatedButton(onPressed: _resetarCronometro, child: const Text("Resetar")),
              ],
            ),

            const Divider(height: 32),
            const Text("Temporizador", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Tempo restante: $_tempoRestante s"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => _iniciarTemporizador(10), child: const Text("Iniciar 10s")),
                ElevatedButton(onPressed: _pararTemporizador, child: const Text("Parar")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
