import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Event {
  const Event({
    required this.title,
    required this.text,
    required this.url,
    required this.time,
    required this.theme,
  });

  final String title;
  final String text;
  final String url;
  final DateTime time;
  final String theme;
}

class Privacy extends StatelessWidget {
  final String url;

  const Privacy({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 0, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}
