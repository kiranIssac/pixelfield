import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/controller/signin_cubit.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/view/collection.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
    Color colorStatus=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff122329),
      appBar: AppBar(
        backgroundColor: const Color(0xff122329),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
                alignment: Alignment.centerLeft,
                child: Text('Sign In',
                    style: TextStyle(fontSize: 22, color: Colors.white))),
            const SizedBox(
              height: 35,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color(0xffD49A00)),
              ),
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xffD49A00))),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            BlocConsumer<SignInCubit, String>(
              listener: (context, status) {
              
                if (status == 'Success') {
                   colorStatus=Colors.green;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyCollection()),
                  );
                }
              },
              builder: (context, signedIn) {
                return Text(signedIn, style: TextStyle(color: colorStatus));
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xffD49A00))),
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;
                context.read<SignInCubit>().signIn(username, password);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Text('Continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
