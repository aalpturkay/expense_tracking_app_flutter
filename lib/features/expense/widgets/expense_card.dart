import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:expense_tracking_app/enums/expense_card_label_type.dart';
import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:flutter/material.dart';

import 'expense_card_delete_button.dart';
import 'expense_card_label.dart';

class ExpenseCard extends StatelessWidget {
  final String expenseCategory;
  final String expensePrice;
  final String expenseDescription;
  final void Function()? onDeleteButtonPressed;
  const ExpenseCard({
    Key? key,
    required this.expenseCategory,
    required this.expensePrice,
    required this.expenseDescription,
    this.onDeleteButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(32),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          // height: 124,
          width: double.infinity,
          decoration: BoxDecoration(
            color: StyleConstants.primaryColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ExpenseCardLabel(
                    lblText: expenseCategory,
                  ),
                  const SizedBox(width: 8),
                  ExpenseCardLabel(
                    lblText: "\$$expensePrice",
                    labelType: ExpenseCardLabelType.money,
                  ),
                  const Spacer(),
                  ExpenseCardDeleteButton(
                    onPressed: onDeleteButtonPressed,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: PoppinsText(
                  fntSize: Theme.of(context).textTheme.headline6?.fontSize,
                  fntWeight: FontWeight.normal,
                  text: expenseDescription,
                  txtColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
