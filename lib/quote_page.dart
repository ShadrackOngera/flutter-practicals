import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<String> fetchQuote() async {
  final response = await http.get(Uri.parse('https://api.kanye.rest'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load quote');
  }
}

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('data'),
      ),
      body: Center(
        child: FutureBuilder<String>(
            future: fetchQuote(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
      ),
    );
  }
}