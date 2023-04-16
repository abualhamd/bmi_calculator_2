
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bmi_provider.dart';
import '../../app/utils/colors_manager.dart';

class CircularPushButton extends StatelessWidget {
  final IconData iconData;
  final String count;

  CircularPushButton({required this.iconData, required this.count});

  @override
  Widget build(BuildContext context) {
    final read = context.read<BMIProvider>();

    return RawMaterialButton(
      elevation: 10,
      fillColor: ColorsManager
          .greyColor,
      //RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 45, height: 45),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (count == 'Age') {
          if (iconData == Icons.add) {
            read.incAge();
          } else {
            read.decAge();
          }
        } else {
          if (iconData == Icons.add) {
            read.incWeight();
          } else {
            read.decWeight();
          }
        }
      },
    );
  }
}
