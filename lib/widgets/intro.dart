import 'package:flutter/material.dart';
class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text('Hello World!'),
          Text('I\'m Erika Valdes (she/her)'),
          Text('Software Engeneer')
        ],
      ),
    );
  }
}
