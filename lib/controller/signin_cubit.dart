import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<String> {
  SignInCubit() : super('');

  void signIn(String username, String password) {
    // Replace this with actual sign-in logic
    if (username == 'e' && password == 'p') {
      
      emit('Success'); // Sign-in successful
    } else {
      emit('Sign in Failed'); // Sign-in failed
    }
  }
}