import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:expense_tracking_app/extensions/string_extension.dart';
import 'package:expense_tracking_app/features/expense/cubit/expense_cubit.dart';
import 'package:expense_tracking_app/features/expense/widgets/expense_card.dart';
import 'package:expense_tracking_app/widgets/custom_button.dart';
import 'package:expense_tracking_app/widgets/custom_form_field.dart';
import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ExpenseCubit>().getExpenses();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: StyleConstants.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(StyleConstants.mdPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: PoppinsText(
                  fntSize: Theme.of(context).textTheme.headline5?.fontSize,
                  fntWeight: FontWeight.bold,
                  text: "Total Balance",
                  txtColor: Colors.white,
                ),
              ),
              BlocBuilder<ExpenseCubit, ExpenseState>(
                builder: (context, state) {
                  if (state is ExpenseLoaded) {
                    return Center(
                      child: PoppinsText(
                        fntSize:
                            Theme.of(context).textTheme.headline3?.fontSize,
                        fntWeight: FontWeight.bold,
                        text: "\$${state.balance ?? "0"}",
                        txtColor: Colors.white,
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: StyleConstants.mdPadding,
                ),
                child: CustomFormField(
                  onChangedCustom: (val) async {
                    await context
                        .read<ExpenseCubit>()
                        .getExpenses(description: val);
                  },
                  hintText: "Search",
                  txtInputAction: TextInputAction.done,
                ),
              ),
              BlocBuilder<ExpenseCubit, ExpenseState>(
                builder: (context, state) {
                  if (state is ExpenseLoading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is ExpenseLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.data?.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: StyleConstants.smPadding,
                          ),
                          child: ExpenseCard(
                            onDeleteButtonPressed: () async {
                              await context
                                  .read<ExpenseCubit>()
                                  .deleteExpenseById(
                                      state.data![index]!.id ?? "");
                            },
                            expenseCategory:
                                state.data![index]!.category.toCategoryFormat,
                            expenseDescription: state.data![index]!.description,
                            expensePrice: state.data![index]!.paid,
                          ),
                        ),
                      ),
                    );
                  }
                  return const Expanded(child: SizedBox());
                },
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, '/addExpensePage');
                },
                title: "Add Expense",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
