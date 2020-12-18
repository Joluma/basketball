import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class QueryParam {
  String key;
  String value;

  QueryParam(this.key, this.value);

  @override
  String toString() {
    return '${this.key}=${this.value}';
  }
}

Future<List> fetchJSONData(String date) async {
  final String url = 'https://${DotEnv().env['BASKET_API_URL']}/games';

  final Map<String, String> headers = {
    "x-rapidapi-host": DotEnv().env['BASKET_API_URL'],
    "x-rapidapi-key": DotEnv().env['BASKET_API_KEY'],
    "useQueryString": "true",
  };

  final Map<String, String> params = {
    "season": "2020-2021",
    "league": "12",
    "date": date
  };

  String query = params.entries.map((e) => QueryParam(e.key, e.value)).toList().join('&');

  var response = await http.get('$url?$query', headers: headers);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);

    if (data['errors'].length > 0) {
      throw Exception('Failed to load data');
    }

    return json.decode(response.body)['response'];
  } else {
    throw Exception('Failed to load data');
  }
}
