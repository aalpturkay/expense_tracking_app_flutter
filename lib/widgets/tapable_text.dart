import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:flutter/material.dart';

class TapableText extends StatelessWidget {
  final String? text;
  final void Function()? onTap;
  const TapableText({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PoppinsText(
        fntSize: Theme.of(context).textTheme.caption?.fontSize,
        fntWeight: FontWeight.bold,
        text: text ?? "",
        txtColor: Colors.white,
      ),
    );
  }
}
