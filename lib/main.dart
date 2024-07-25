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
  // List<int>? twoSum(List<int> nums, int target) {
  //   Map<int, int> hashMap = {};
  //   for (int i = 0; i < nums.length; i++) {
  //     int x = target - nums[i];

  //     if (hashMap.containsKey(x)) {
  //       return [i, hashMap[x]!];
  //     }
  //     hashMap[nums[i]] = i;
  //   }
  //   return null;
  // }

  // bool checkRepeatation(int start, int end, s) {
  //   Set<String> chars = Set<String>();

  //   for (int i = start; i < end; i++) {
  //     String char = s.substring(i, i + 1);

  //     if (chars.contains(char)) {
  //       return false;
  //     }
  //     chars.add(char);
  //   }
  //   return true;
  // }

  // int? lengthOfLongestSubstring(String s) {
  //   int n = s.length;

  //   int max1 = 0;
  //   for (int i = 0; i < n; i++) {
  //     for (int j = i; j < n; j++) {
  //       if (checkRepeatation(i, j, s)) {
  //         max1 = max(max1, j - i + 1);
  //       }
  //     }
  //   }
  //   return max1;
  // }

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
              color: Color(0xff122329),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text('Text text text',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xffD49A00))),
                      onPressed: () {},
                      child: Text('Scan bottle',
                          style: TextStyle(fontSize: 18, color: Colors.black))),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an account?',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
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
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
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
