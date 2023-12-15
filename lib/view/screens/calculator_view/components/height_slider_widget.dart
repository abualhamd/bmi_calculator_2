import 'package:flutter/material.dart';

import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/colors_manager.dart';
import '../../../../app/utils/decorations_and_styles.dart';
import '../../../components/card.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({
    Key? key,
    required this.height,
    required this.onHeightChanged,
  }) : super(key: key);

  final int height;
  final void Function(double) onHeightChanged;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: CardWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.height,
              style: kActiveTitleTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: kNumbersTextStyle,
                ),
                Text(
                  AppStrings.cm,
                  style: TextStyle(
                    color: ColorsManager.greyColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                thumbColor: ColorsManager.pinkColor,
                overlayColor: ColorsManager.sliderOverlayColor,
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 10, disabledThumbRadius: 10),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 25,
                ),
                activeTrackColor: ColorsManager.activeTrackColor,
                inactiveTrackColor: ColorsManager.inactiveTrackColor,
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120,
                max: 220,
                onChanged: onHeightChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
