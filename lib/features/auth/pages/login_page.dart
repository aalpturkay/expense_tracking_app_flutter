import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:expense_tracking_app/extensions/validation_extension.dart';
import 'package:expense_tracking_app/features/auth/cubit/auth_cubit.dart';
import 'package:expense_tracking_app/widgets/custom_button.dart';
import 'package:expense_tracking_app/widgets/custom_form_field.dart';
import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:expense_tracking_app/widgets/tapable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: StyleConstants.bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 64,
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerTextGroup(),
              const SizedBox(height: 64),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      textEditingController: usernameController,
                      hintText: "Username",
                      txtInputAction: TextInputAction.next,
                      validatorFunc: (val) {
                        if (val == null || val.isEmpty) {
                          return 'username must be filled out.';
                        }
                        if (!val.isValidUsername) {
                          return "Please enter a valid username.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      textEditingController: passwordController,
                      obsecureText: true,
                      txtInputAction: TextInputAction.done,
                      hintText: "Password",
                      validatorFunc: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Password must be filled out.';
                        }
                        if (!val.isValidPassword) {
                          return 'Password must be at least 6 characters.';
                        }
                      },
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthError) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: PoppinsText(
                              fntSize: 18,
                              fntWeight: FontWeight.bold,
                              text: state.message ?? "",
                              txtColor: Colors.red,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await context.read<AuthCubit>().login(
                          username: usernameController.text,
                          password: passwordController.text,
                        );
                    Navigator.pushNamed(context, "/expensePage");
                  }
                },
                title: "Sign In",
                childWidget: context.watch<AuthCubit>().state is AuthLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : null,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Spacer(),
                  TapableText(
                    text: "Don’t have and account?  Register",
                    onTap: () {
                      Navigator.pushNamed(context, '/registerPage');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerTextGroup() {
    return RichText(
      text: TextSpan(
        text: "Sign in and track your\n",
        style: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: "Expenses.",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: StyleConstants.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
