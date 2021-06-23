import 'package:flutter/material.dart';
import 'package:flutter_progress_indicator/widgets/linearIndicator.dart';

class AnimatedLinearIndicator extends StatefulWidget {
  final double endvalue;
  const AnimatedLinearIndicator({ Key? key, required this.endvalue }) : super(key: key);

  @override
  _AnimatedLinearIndicatorState createState() => _AnimatedLinearIndicatorState();
}

class _AnimatedLinearIndicatorState extends State<AnimatedLinearIndicator> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: this.widget.endvalue),
      duration: Duration(milliseconds: 700),
      builder: (context, double value, child){
        print(value.toString());
        return LinearIndicator(value: value);
      }
    );
  }
}