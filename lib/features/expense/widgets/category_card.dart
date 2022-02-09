import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final bool isSelected;
  final void Function()? onTap;
  const CategoryCard({
    Key? key,
    this.isSelected = false,
    this.onTap,
    required this.imagePath,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color:
              isSelected ? StyleConstants.secondaryColor : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      color: StyleConstants.primaryColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 64,
              width: 64,
            ),
            PoppinsText(
              fntSize: Theme.of(context).textTheme.bodyText1?.fontSize,
              fntWeight: FontWeight.bold,
              text: categoryName,
              txtColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
