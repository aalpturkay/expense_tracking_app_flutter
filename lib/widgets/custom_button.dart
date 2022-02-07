import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final Color? titleColor;
  final Color? btnColor;
  final Widget? childWidget;
  const CustomButton({
    Key? key,
    this.onTap,
    this.title,
    this.titleColor,
    this.btnColor,
    this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Ink(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: btnColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: childWidget ??
              PoppinsText(
                txtColor: titleColor ?? Colors.black,
                fntSize: 24,
                fntWeight: FontWeight.bold,
                text: title ?? "",
              ),
        ),
      ),
      // style: ElevatedButton.styleFrom(
      //   primary: btnColor ?? Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      // ),
    );
  }
}
