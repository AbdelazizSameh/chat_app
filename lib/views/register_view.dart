import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/helpers.dart';
import 'package:chat_app/widgets/custom_sign_and_register_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:chat_app/widgets/row_with_register_or_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'registerView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
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
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      CustomTextFormField(
                        onChanged: (String emailValue) {
                          email = emailValue;
                        },
                        hintText: 'Email',
                        labelText: 'example@gmail.com',
                      ),

                      CustomTextFormField(
                        obsecureText: true,
                        // formKey: formKey,
                        onChanged: (String passwordValue) {
                          password = passwordValue;
                        },
                        hintText: 'Password',
                        labelText: 'min length is 8',
                      ),
                      CustomSignAndRegisterButton(
                        text: 'Register',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await registerUser();
                              showSnackBar(context, message: 'success');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(
                                  context,
                                  message: 'The password provided is too weak.',
                                );
                              } else if (e.code == 'email-already-in-use') {
                                showSnackBar(
                                  context,
                                  message:
                                      'The account already exists for that email.',
                                );
                              }
                            }
                          } else {}
                          isLoading = false;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  RowWithRegisterOrSignIn(
                    textPartoOne: "Already have an account?",
                    textPartTwo: " Sign In",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
