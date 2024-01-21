import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resunoo AI'),
      ),
      body: const WebView(
        initialUrl: 'https://resunoo.vercel.app',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}