import 'package:bmi_calculator_2/components/card.dart';
import 'package:flutter/material.dart';
import 'card.dart';

class GenderCard extends StatefulWidget {
  final String gender;
  final IconData genderIconData;
  Color color;

  GenderCard(
      {required this.gender,
      required this.genderIconData,
      required this.color});

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: Column(
          children: [
            Icon(
              widget.genderIconData,
              color: widget.color,
              size: 100,
            ),
            Text(
              widget.gender,
              style: TextStyle(
                fontSize: 20,
                color: widget.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
