import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Future function
Future<Map<String, dynamic>> fetchJoke() async {
  final response =
      await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    return jsonResponse;
  } else {
    throw Exception('Failed to load quote');
  }
}

class ChuckPage extends StatefulWidget {
  const ChuckPage({super.key});

  @override
  State<ChuckPage> createState() => _ChuckPageState();
}

class _ChuckPageState extends State<ChuckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Quotes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('data'),
            FutureBuilder<Map<String, dynamic>>(
              future: fetchJoke(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(snapshot.data!['value']),
                      Text('ID: ${snapshot.data!['id']}'),
                      Text('Created at: ${snapshot.data!['created_at']}'),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
