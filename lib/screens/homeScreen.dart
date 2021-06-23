import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_indicator/widgets/animatedCircularIndicator.dart';
import 'package:flutter_progress_indicator/widgets/animatedLinearIndicator.dart';
import 'package:flutter_progress_indicator/widgets/circularIndicator.dart';
import 'package:flutter_progress_indicator/widgets/linearIndicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _valueTextController = TextEditingController();
  double _endValue = 0.7;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body()
      ),
    );
  }

  Widget _body(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          SizedBox(height: 50,),
          _pieChartRow(),
          SizedBox(height: 50,),
          _linearProgressRow(),
          SizedBox(height: 50,),
          _animatedCircularIndicatorHolder(),
          SizedBox(height: 50,),
          _animatedLinearProgressHolder(),
          SizedBox(height: 50,),
          _valueTextField(),
          _animateButton(),
        ]
      )
    );
  }

  Widget _pieChartRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _circularIndicatorHolder(),
    ],);
  }

  Widget _linearProgressRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _linearProgressHolder(),
    ],);
  }

  Widget _circularIndicatorHolder(){
    return Container(
      width: 150,
      height: 150,
      child: AspectRatio(
        aspectRatio: 1,
        child: CircularIndicator(value: _endValue)
      )
    );
  }

  Widget _linearProgressHolder(){
    return Container(
      width: 300,
      height: 10,
      child: AspectRatio(
        aspectRatio: 1,
        child: LinearIndicator(value: _endValue)
      ),
    );
  }

  Widget _animatedCircularIndicatorHolder(){
    return Container(
      width: 150,
      height: 150,
      child: AspectRatio(
        aspectRatio: 1,
        child: AnimatedCircularIndicator(endvalue: _endValue)
      )
    );
  }

  Widget _animatedLinearProgressHolder(){
    return Container(
      width: 300,
      height: 10,
      child: AspectRatio(
        aspectRatio: 1,
        child: AnimatedLinearIndicator(endvalue: _endValue)
      ),
    );
  }

  Widget _valueTextField(){
    return Container(
      width: 300,
      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: TextField(
        controller: _valueTextController,
        decoration: new InputDecoration(labelText: "Enter a value between 0-100"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
      )
    );
  }

  Widget _animateButton(){
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          _endValue = 0;
        });
        await Future.delayed(Duration(milliseconds: 1000));
        setState(() {
          var endValue = double.parse(_valueTextController.text); 
          _endValue =  endValue / 100;
        });
      }, 
      child: Text("Animate")
    );
  }
}