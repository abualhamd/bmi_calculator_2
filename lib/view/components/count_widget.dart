import 'package:bmi_calculator_2/app/utils/decorations_and_styles.dart';
import 'package:bmi_calculator_2/view/provider/bmi_provider.dart';
import 'package:flutter/material.dart';
import '../../app/utils/app_strings.dart';
import 'card.dart';
import 'package:provider/provider.dart';

import 'circular_push_button.dart';

class CountWidget extends StatelessWidget {
  final String title;

  CountWidget({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BMIProvider>();

    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: kActiveTitleTextStyle,
            ),
            Text(
              title == AppStrings.weight
                  ? watch.bmiModel.weight.toString()
                  : watch.bmiModel.age.toString(),
              style: kNumbersTextStyle,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPushButton(
                  iconData: Icons.add,
                  count: title,
                ),
                CircularPushButton(
                  iconData: Icons.remove,
                  count: title,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}