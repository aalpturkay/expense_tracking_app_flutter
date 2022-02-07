import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:expense_tracking_app/extensions/expense_category_type_extension.dart';
import 'package:expense_tracking_app/features/expense/cubit/add_expense_cubit.dart';
import 'package:expense_tracking_app/features/expense/widgets/category_card.dart';
import 'package:expense_tracking_app/widgets/custom_button.dart';
import 'package:expense_tracking_app/widgets/custom_form_field.dart';
import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({Key? key}) : super(key: key);

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PoppinsText(
                fntSize: 24,
                fntWeight: FontWeight.bold,
                text: "Add your expense",
                txtColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        validatorFunc: (val) {
                          if (val == null || val.isEmpty) {
                            return "Description must be filled out.";
                          }
                        },
                        textEditingController: descriptionController,
                        txtInputAction: TextInputAction.next,
                        hintText: "Short description",
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomFormField(
                              validatorFunc: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Amount must be filled out.";
                                }
                              },
                              textEditingController: amountController,
                              keyboardType: TextInputType.number,
                              hintText: "Amount",
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SizedBox(
                              height: 64,
                              child: CustomButton(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await context
                                        .read<AddExpenseCubit>()
                                        .createExpense(
                                          description:
                                              descriptionController.text,
                                          paid: amountController.text,
                                          category: context
                                              .read<AddExpenseCubit>()
                                              .expenseCategories[selectedIndex]
                                              .categoryType
                                              .name
                                              .toUpperCase(),
                                        );
                                    Navigator.popAndPushNamed(
                                        context, '/expensePage');
                                  }
                                },
                                title: "Add",
                                childWidget: context
                                        .watch<AddExpenseCubit>()
                                        .state is AddExpenseLoading
                                    ? const CircularProgressIndicator()
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const PoppinsText(
                fntSize: 24,
                fntWeight: FontWeight.bold,
                text: "Choose category",
                txtColor: Colors.white,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  padding: const EdgeInsets.all(16),
                  children: List.generate(
                    context.read<AddExpenseCubit>().expenseCategories.length,
                    (index) => CategoryCard(
                        categoryName: context
                            .read<AddExpenseCubit>()
                            .expenseCategories[index]
                            .categoryType
                            .toReadable,
                        imagePath: context
                            .read<AddExpenseCubit>()
                            .expenseCategories[index]
                            .imagePath,
                        isSelected: selectedIndex == index ? true : false,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
