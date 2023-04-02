import 'package:flutter/material.dart';
import 'package:practicals/Chuck_page.dart';
import 'package:practicals/quote_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const QuotePage();
                },
              ),
            );
          },
          child: const Text('Kanye Quotes'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const ChuckPage();
                },
              ),
            );
          },
          child: const Text('Chuck Jokes'),
        )
      ],
    ));
  }
}
