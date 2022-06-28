import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();
  String? _message;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      _message =
          'Key: ${event.logicalKey.debugName}, KeyId: ${event.logicalKey.keyId}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sample'),
      ),
      body: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (event) => _handleKeyEvent(event),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const TextField(),
          Text(_message ?? 'Press a key'),
        ]),
      ),
    );
  }
}
