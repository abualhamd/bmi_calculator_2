import 'package:flutter/material.dart';

import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/colors_manager.dart';
import '../../../../app/utils/enums/enums.dart';
import '../../../components/gender_card.dart';

class GenderRowWidget extends StatelessWidget {
  const GenderRowWidget({
    required this.choosenGender,
    required this.onCardTapped,
    Key? key,
  }) : super(key: key);

  final Gender? choosenGender;
  final void Function({required Gender gender}) onCardTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              onCardTapped(gender: Gender.male);
            },
            child: GenderCard(
              gender: AppStrings.male,
              genderIconData: Icons.male,
              color: choosenGender == Gender.male
                  ? ColorsManager.white
                  : ColorsManager.greyColor,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onCardTapped(gender: Gender.female);
            },
            child: GenderCard(
              gender: AppStrings.female,
              genderIconData: Icons.female,
              color: choosenGender == Gender.female
                  ? ColorsManager.white
                  : ColorsManager.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
