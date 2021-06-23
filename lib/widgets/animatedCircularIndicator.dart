import 'package:flutter/material.dart';
import 'package:flutter_progress_indicator/widgets/circularIndicator.dart';

class AnimatedCircularIndicator extends StatefulWidget {
  final double endvalue;
  const AnimatedCircularIndicator({ Key? key, required this.endvalue }) : super(key: key);

  @override
  _AnimatedCircularIndicatorState createState() => _AnimatedCircularIndicatorState();
}

class _AnimatedCircularIndicatorState extends State<AnimatedCircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: this.widget.endvalue),
      duration: Duration(milliseconds: 700),
      builder: (context, double value, child){
        print(value.toString());
        return CircularIndicator(value: value);
      }
    );
  }
}