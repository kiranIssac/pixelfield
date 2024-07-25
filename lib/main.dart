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
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color(0xff0B1519),
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const Text('Text text text',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xffD49A00))),
                      onPressed: () {},
                      child: const Padding(
                         padding: EdgeInsets.only(left: 40,right: 40),
                
                        child: Text('Scan bottle',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account?',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      const SizedBox(
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
                        child: const Text(
                          'Sign in first',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD49A00)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
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
