import 'package:flutter/material.dart';

import '../model/item.dart';

class DetailPage extends StatelessWidget {
  final Item item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
                      Image.asset(
                            item.image,
                            width: 200,
                            height: 
                      300,
                            fit: BoxFit.cover,
                          ),
            Text(
                'Details for ${item.title}',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
        
      ),
    );
  }
}