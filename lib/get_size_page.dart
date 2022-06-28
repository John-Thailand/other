import 'package:flutter/material.dart';

class GetSizePage extends StatefulWidget {
  const GetSizePage({Key? key}) : super(key: key);

  @override
  State<GetSizePage> createState() => _GetSizePageState();
}

class _GetSizePageState extends State<GetSizePage> {
  final keyText = GlobalKey();
  Size size = const Size(0, 0);
  Offset position = const Offset(100, 100);

  void calculateSizeAndPosition() =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final RenderBox box =
            keyText.currentContext?.findRenderObject() as RenderBox;

        setState(() {
          position = box.localToGlobal(Offset.zero);
          size = box.size;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Widget Size & Position'),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      key: keyText,
                      'What is my Widget Size & Position',
                    ),
                    ElevatedButton(
                      onPressed: calculateSizeAndPosition,
                      child: const Text('Caluculate'),
                    ),
                    const SizedBox(height: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Width: ${size.width.toInt()}'),
                        Text('Height: ${size.height.toInt()}'),
                        Text('X: ${position.dx.toInt()}'),
                        Text('Y: ${position.dy.toInt()}'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Container(
            width: size.width,
            height: size.height,
            color: const Color.fromRGBO(0, 0, 0, 0.3),
          ),
        )
      ],
    );
  }
}
