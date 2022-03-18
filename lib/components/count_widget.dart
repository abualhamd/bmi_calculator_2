import 'package:bmi_calculator_2/constants/colors.dart';
import 'package:bmi_calculator_2/constants/decorations_and_styles.dart';
import 'package:bmi_calculator_2/models/count_data.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'package:provider/provider.dart';

class CountWidget extends StatefulWidget {
  final String title;

  CountWidget({
    required this.title,
  });

  @override
  _CountWidgetState createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
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
              widget.title,
              style: kActiveTitleTextStyle,
            ),
            Text(
              widget.title == 'Weight'
                  ? '${Provider.of<CountData>(context).showWeight}'
                  : '${Provider.of<CountData>(context).showAge}',
              style: kNumbersTextStyle,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularActionButton(
                  iconData: Icons.add,
                  count: widget.title,
                ),
                CircularActionButton(
                  iconData: Icons.remove,
                  count: widget.title,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CircularActionButton extends StatefulWidget {
  final IconData iconData;
  final String count;

  CircularActionButton({required this.iconData, required this.count});

  @override
  _CircularActionButtonState createState() => _CircularActionButtonState();
}

class _CircularActionButtonState extends State<CircularActionButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      fillColor:
          kGreyColor, //RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 45, height: 45),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          widget.iconData,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (widget.count == 'Age') {
          if (widget.iconData == Icons.add) {
            setState(() {
              Provider.of<CountData>(context, listen: false).incAge();
            });
          } else {
            Provider.of<CountData>(context, listen: false).decAge();
          }
        } else {
          if (widget.iconData == Icons.add) {
            Provider.of<CountData>(context, listen: false).incWeight();
          } else {
            Provider.of<CountData>(context, listen: false).decWeight();
          }
        }
      },
    );
  }
}
