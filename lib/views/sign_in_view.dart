import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/cubits/login_cubit/login_state.dart';
import 'package:chat_app/helpers/helpers.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_sign_and_register_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:chat_app/widgets/row_with_register_or_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static String id = 'signInView';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isLoading = false;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          showSnackBar(context, message: 'success');
          isLoading = false;
          Navigator.pushNamed(context, ChatView.id, arguments: email);
        } else if (state is LoginFailureState) {
          isLoading = false;
          showSnackBar(context, message: state.message);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 120),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(kLogo),
                        Text(
                          "Scholar Chat",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pacifico-Regular',
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        CustomTextFormField(
                          onChanged: (emailValue) {
                            email = emailValue;
                          },
                          hintText: 'Email',
                          labelText: 'example@gmail.com',
                        ),
                        CustomTextFormField(
                          obsecureText: true,
                          onChanged: (passwordValue) {
                            password = passwordValue;
                          },
                          hintText: 'Password',
                          labelText: 'min length is 8',
                        ),

                        CustomSignAndRegisterButton(
                          text: 'Sign In',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(
                                context,
                              ).signInUser(email: email!, password: password!);
                            }
                          },
                        ),
                      ],
                    ),
                    RowWithRegisterOrSignIn(
                      textPartoOne: "Don't have an account?",
                      textPartTwo: " Register",
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RegisterView.id,
                          arguments: email,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
