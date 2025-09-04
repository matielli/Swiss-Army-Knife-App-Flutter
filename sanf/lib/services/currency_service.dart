import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  static const _baseUrl = "https://api.exchangerate.host/latest";

  static Future<double?> converterMoeda(
      String de, String para, double valor) async {
    final url = Uri.parse("$_baseUrl?base=$de&symbols=$para");

    try {
      final resposta = await http.get(url);

      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body);
        final taxa = dados["rates"][para];
        if (taxa != null) {
          return valor * (taxa as num).toDouble();
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
