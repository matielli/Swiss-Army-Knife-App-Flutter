class DateService {
  // Diferença absoluta entre duas datas
  static Duration difference(DateTime d1, DateTime d2) {
    return d1.difference(d2).abs();
  }

  // Converter fuso horário (offset em horas)
  static DateTime convertTimezone(DateTime date, int offsetHours) {
    return date.toUtc().add(Duration(hours: offsetHours));
  }

  // Cronômetro simples
  static Stopwatch startStopwatch() {
    return Stopwatch()..start();
  }

  // Temporizador simples com callback a cada segundo
  static Future<void> startTimer(
      int seconds, void Function(int remaining) onTick) async {
    int remaining = seconds;

    while (remaining > 0) {
      await Future.delayed(const Duration(seconds: 1));
      remaining--;
      onTick(remaining);
    }
  }
}
