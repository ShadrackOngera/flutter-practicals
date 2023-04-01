import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Future function
Future<String> fetchQuote() async {
  final response = await http.get(Uri.parse('https://api.kanye.rest'));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    String quote = jsonResponse['quote'];
    return quote;
  } else {
    throw Exception('Failed to load quote');
  }
}

//Reload Page function
void reloadPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (BuildContext context) => const QuotePage()),
  );
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
        title: const Text(
          'Kanye West Quotes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                reloadPage(context);
              },
              child: const Text(
                'Another Quote',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
