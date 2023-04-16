import 'package:bmi_calculator_2/view/components/card.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final IconData genderIconData;
  final Color color;

  GenderCard(
      {required this.gender,
      required this.genderIconData,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: Column(
          children: [
            Icon(
              genderIconData,
              color: color,
              size: 100,
            ),
            Text(
              gender,
              style: TextStyle(
                fontSize: 20,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
