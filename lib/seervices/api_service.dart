import 'dart:convert';

import 'package:fluttoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiServece {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // final List<dynamic> webtoons = jsonDecode(response.body);
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        // webtoonInstances.add(WebtoonModel(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
