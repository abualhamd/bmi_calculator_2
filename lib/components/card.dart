import 'package:bmi_calculator_2/constants/decorations_and_styles.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final Widget child;

  CardWidget({required this.child});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      child: widget.child,
    );
  }
}
