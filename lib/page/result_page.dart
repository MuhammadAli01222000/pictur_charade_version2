import 'package:flutter/cupertino.dart';

class ResultPage extends StatefulWidget {
  final int correct;
  final int wrong;
  const ResultPage({super.key, required this.correct, required this.wrong});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
