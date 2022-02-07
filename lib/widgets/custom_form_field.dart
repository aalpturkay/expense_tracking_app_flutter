import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  final void Function(String)? onChangedCustom;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validatorFunc;
  final String? hintText;
  final bool obsecureText;
  final TextInputAction? txtInputAction;
  final TextInputType? keyboardType;
  const CustomFormField({
    Key? key,
    this.validatorFunc,
    this.hintText,
    this.obsecureText = false,
    this.textEditingController,
    this.txtInputAction,
    this.keyboardType,
    this.onChangedCustom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textEditingController,
      textInputAction: txtInputAction,
      onFieldSubmitted: (value) {},
      obscureText: obsecureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validatorFunc,
      onChanged: onChangedCustom,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: Colors.white54,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: StyleConstants.secondaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white54,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
