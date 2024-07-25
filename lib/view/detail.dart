import 'package:flutter/material.dart';

import '../model/item.dart';

class DetailPage extends StatelessWidget {
  final Item item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff0B1519),
      appBar: AppBar(backgroundColor: Color(0xff0B1519),foregroundColor: Colors.white,
  
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
                        Image.asset(
                              item.image,
                              width: 200,
                              height: 
                        300,
                              fit: BoxFit.cover,
                            ),
              Container( color: const Color(0xff122329),height: 500,width: MediaQuery.of(context).size.width*.85,
                child: Text(
                    'Details for ${item.title}',
                    style: TextStyle(fontSize: 22,color: Color(0xffD49A00)),
                  ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}