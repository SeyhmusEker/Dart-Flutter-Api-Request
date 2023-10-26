import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiIstekGonder extends StatefulWidget {
  @override
  _ApiIstekGonderState createState() => _ApiIstekGonderState();
}

class _ApiIstekGonderState extends State<ApiIstekGonder> {
  final String apiUrl = 'www.example.com';
  final String token =
      "Token code";

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      // Başarılı istek
      print('API yanıtı: ${response.body}');
    } else {
      // Hata durumu
      print('Hata kodu: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API İsteği Örneği'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchData,
          child: Text('API İsteği Yap'),
        ),
      ),
    );
  }
}
