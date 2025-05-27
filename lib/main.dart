import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttoon/screens/home_screen.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  final ts =
      DateTime.now().millisecondsSinceEpoch
          .toString(); // or any static timestamp

  final String publicKey = dotenv.env['PUBLIC_KEY'] ?? '';
  final String privateKey = dotenv.env['PRIVATE_KEY'] ?? '';

  final input = ts + privateKey + publicKey;
  final bytes = utf8.encode(input);
  final digest = md5.convert(bytes);
  print('ts: $ts');
  print('hash: $digest');

  await fetchMarvelCharacters();

  runApp(App());
}

// * st -> then choose option to create widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

Future<void> fetchMarvelCharacters() async {
  final ts = DateTime.now().millisecondsSinceEpoch.toString();
  final publicKey = dotenv.env['PUBLIC_KEY']!;
  final privateKey = dotenv.env['PRIVATE_KEY']!;
  final hash = md5.convert(utf8.encode(ts + privateKey + publicKey)).toString();

  final url = Uri.parse(
    'https://gateway.marvel.com/v1/public/characters'
    '?ts=$ts&apikey=$publicKey&hash=$hash',
  );
  print(url);
  final res = await http.get(url);
  // print(jsonDecode(res.body));
}
