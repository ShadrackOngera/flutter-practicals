import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String quote = '';
  Future<String> getkanye () async{
    try {
      var response = await http.get(Uri.https('api.kanye.rest'));
      // debugPrint(response.body);
      var result = json.decode(response.body);
      debugPrint(result['quote']);

    } catch (e) {
      debugPrint('e');
    }

    return quote;
  }

  @override
  Widget build(BuildContext context) {

    getkanye().then((value) => quote = value);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(quote),
      ),
    );
  }
}
