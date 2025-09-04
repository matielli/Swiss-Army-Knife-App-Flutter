import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String baseUrl = "https://api.exchangerate.host/latest";

  Future<double?> getExchangeRate(String from, String to) async {
    final response = await http.get(Uri.parse("$baseUrl?base=$from&symbols=$to"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["rates"][to] != null ? data["rates"][to] + 0.0 : null;
    } else {
      throw Exception("Erro ao buscar taxa de câmbio");
    }
  }
}
