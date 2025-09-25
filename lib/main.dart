import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SignInView.id,
        routes: {
          RegisterView.id: (context) => RegisterView(),
          SignInView.id: (context) => SignInView(),
          ChatView.id: (context) => ChatView(),
        },
        home: Scaffold(body: SignInView()),
      ),
    );
  }
}
