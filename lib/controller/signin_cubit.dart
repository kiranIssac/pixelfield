import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<bool> {
  SignInCubit() : super(false);

  void signIn(String username, String password) {
    // Replace this with actual sign-in logic
    if (username == '' && password == '') {
      
      emit(true); // Sign-in successful
    } else {
      emit(false); // Sign-in failed
    }
  }
}