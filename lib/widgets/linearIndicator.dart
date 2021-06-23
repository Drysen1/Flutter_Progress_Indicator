import 'package:flutter/material.dart';

class LinearIndicator extends StatefulWidget {
  final double value;
  const LinearIndicator({ Key? key, required this.value }) : super(key: key);

  @override
  _LinearIndicatorState createState() => _LinearIndicatorState();
}

class _LinearIndicatorState extends State<LinearIndicator> {
  @override
  Widget build(BuildContext context) {
    return  LinearProgressIndicator(
      value: this.widget.value,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.greenAccent),
      backgroundColor: Colors.grey,
    );
  }
}