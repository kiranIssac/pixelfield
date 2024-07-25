import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Scaffold(backgroundColor: const Color(0xff122329),
      appBar: AppBar(backgroundColor: const Color(0xff122329),foregroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Sign In',style: TextStyle(fontSize: 22, color: Colors.white))),
              SizedBox(height: 35,),
            TextField(style: TextStyle(color: Colors.white),
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(color: Color(0xffD49A00)),),
            ),
            TextField(style: TextStyle(color: Colors.white),
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(color: Color(0xffD49A00))),
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
               style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xffD49A00))),
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;
                context.read<SignInCubit>().signIn(username, password);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Text('Continue', style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
