import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Repository/mock_api.dart';
import 'package:flutter_application_2/controller/signin_cubit.dart';
import 'package:flutter_application_2/view/signIn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  MockApi.setupMockClient();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff122329),
                  border: Border.all(
                    color: const Color(0xff122329),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text('Text text text',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xffD49A00))),
                      onPressed: () {},
                      child: Padding(
                         padding: const EdgeInsets.only(left: 40,right: 40),
                
                        child: Text('Scan bottle',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an account?',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (_) => SignInCubit(),
                                      child: SignIn(),
                                    )),
                          );
                        },
                        child: Text(
                          'Sign in first',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD49A00)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
