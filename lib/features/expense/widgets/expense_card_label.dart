import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:flutter/material.dart';

import '../../../enums/expense_card_label_type.dart';

class ExpenseCardLabel extends StatelessWidget {
  final String lblText;
  final ExpenseCardLabelType labelType;
  const ExpenseCardLabel({
    Key? key,
    this.labelType = ExpenseCardLabelType.category,
    required this.lblText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: labelType == ExpenseCardLabelType.category
            ? StyleConstants.lblCategoryColor
            : StyleConstants.lblMoneyColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: PoppinsText(
        fntSize: 18,
        fntWeight: FontWeight.bold,
        text: lblText,
        txtColor: Colors.white,
      ),
    );
  }
}
