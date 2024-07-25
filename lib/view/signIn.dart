import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/signin_cubit.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/view/my_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
                   BlocConsumer<SignInCubit, bool>(
              listener: (context, signedIn) {
                if (signedIn) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyCollection()),
                  );
                }
              },
              builder: (context, signedIn) {
                return signedIn
                    ? Text('Sign-in Successful', style: TextStyle(color: Colors.green))
                    : Text('Sign-in Failed', style: TextStyle(color: Colors.red));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;
                context.read<SignInCubit>().signIn(username, password);
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
