import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:flutter/material.dart';

class ExpenseCardDeleteButton extends StatelessWidget {
  final void Function()? onPressed;
  const ExpenseCardDeleteButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Ink(
          padding: const EdgeInsets.all(StyleConstants.smPadding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: StyleConstants.bgColor,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
