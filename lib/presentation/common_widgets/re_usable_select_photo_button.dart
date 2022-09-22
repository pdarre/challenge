import 'package:challenge/core/colors.dart';
import 'package:flutter/material.dart';

class SelectPhoto extends StatelessWidget {
  final String textLabel;
  final IconData icon;

  final void Function()? onTap;

  const SelectPhoto({
    Key? key,
    required this.textLabel,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        primary: ColorsConst.elevatedButtonColor,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorsConst.plainBlackColor),
            const SizedBox(
              width: 14,
            ),
            Text(
              textLabel,
              style: TextStyle(
                fontSize: 18,
                color: ColorsConst.plainBlackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
