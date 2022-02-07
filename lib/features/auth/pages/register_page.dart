import 'package:expense_tracking_app/constants/style_constants.dart';
import 'package:expense_tracking_app/extensions/validation_extension.dart';
import 'package:expense_tracking_app/features/auth/cubit/auth_cubit.dart';
import 'package:expense_tracking_app/widgets/custom_button.dart';
import 'package:expense_tracking_app/widgets/custom_form_field.dart';
import 'package:expense_tracking_app/widgets/poppins_text.dart';
import 'package:expense_tracking_app/widgets/tapable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (context.watch<AuthCubit>().state is AuthError) {}
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: StyleConstants.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 64,
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headerTextGroup(),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 64),
                    CustomFormField(
                      txtInputAction: TextInputAction.next,
                      textEditingController: usernameController,
                      hintText: "Username",
                      validatorFunc: (val) {
                        if (val == null || val.isEmpty) {
                          return "Username must be filled out.";
                        }
                        if (!val.isValidUsername) {
                          return "Please enter a valid username.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      txtInputAction: TextInputAction.done,
                      textEditingController: passwordController,
                      obsecureText: true,
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
                    await context.read<AuthCubit>().register(
                          username: usernameController.text,
                          password: passwordController.text,
                        );
                    Navigator.pushNamed(context, "/expensePage");
                  }
                },
                title: "Register",
                childWidget: context.watch<AuthCubit>().state is AuthLoading
                    ? const CircularProgressIndicator()
                    : null,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Spacer(),
                  TapableText(
                    text: "Already have an account?  Login",
                    onTap: () {
                      Navigator.pushNamed(context, '/loginPage');
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
        text: "Let's register\n",
        style: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: "to ",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "monitorize ",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: StyleConstants.secondaryColor,
            ),
          ),
          TextSpan(
            text: "your 💰",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
