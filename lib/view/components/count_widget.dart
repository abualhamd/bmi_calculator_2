import 'package:bmi_calculator_2/app/utils/decorations_and_styles.dart';
import 'package:bmi_calculator_2/view/provider/bmi_provider.dart';
import 'package:flutter/material.dart';
import '../../app/utils/app_strings.dart';
import 'card.dart';
import 'package:provider/provider.dart';

import 'circular_push_button.dart';

class CountWidget extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CountWidget({
    required this.title,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {

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
              count.toString(),
              style: kNumbersTextStyle,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPushButton(
                  onPressed: onIncrease,
                  iconData: Icons.add,
                  count: title,
                ),
                CircularPushButton(
                  onPressed: onDecrease,
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
