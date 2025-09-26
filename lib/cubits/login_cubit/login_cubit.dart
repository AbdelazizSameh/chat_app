import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    var errorMessage = '';
    emit(LoginLoadingState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = e.code;
      }

      emit(LoginFailureState(message: errorMessage));
    } catch (e) {
      errorMessage = 'there was an error, try again later.';
      emit(LoginFailureState(message: errorMessage));
    }
  }
}
