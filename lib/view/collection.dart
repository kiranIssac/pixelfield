import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Repository/mock_api.dart';
import 'package:flutter_application_2/model/item.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/view/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyCollection extends StatefulWidget {
  const MyCollection({super.key});

  @override
  State<MyCollection> createState() => _MyCollectionState();
}

class _MyCollectionState extends State<MyCollection> {
  int _selectedIndex = 0;
  List<Item> _items = [];
  late Timer _connectivityTimer;
  @override
  void initState() {
    super.initState();
    _loadData();
    startConnectivityCheck();
  }

  void startConnectivityCheck() {
 
    _connectivityTimer =
        Timer.periodic(const Duration(seconds: 5), (timer) async {
             final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        _refreshData();
;
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        _refreshData();
      
       
      }
    });
  }

  Future<void> _loadData() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      _refreshData();
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      _refreshData();
    } else {
      startConnectivityCheck();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? storedData = prefs.getString('items');

      if (storedData != null) {
        List<dynamic> decodedData = json.decode(storedData);
        setState(() {
          _items = decodedData.map((item) => Item.fromJson(item)).toList();
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("See Offline Mode"),
        ));
      }
    }
  }

  Future<void> _refreshData() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        final response = await MockApi.dio.get('/posts');
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('items', json.encode(data));

          setState(() {
            _items = data.map((json) => Item.fromJson(json)).toList();
          });
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        throw Exception('Exception: $e');
      }
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        final response = await MockApi.dio.get('/posts');
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('items', json.encode(data));

          setState(() {
            _items = data.map((json) => Item.fromJson(json)).toList();
          });
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        throw Exception('Exception: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No internet"),
      ));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1519),
      appBar: AppBar(
        backgroundColor: const Color(0xff0B1519),
        foregroundColor: Colors.white,
        title: const Text('My collection'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              // Handle icon button press
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: _items.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .65,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: _items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = _items[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(item: item),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff122329),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 30),
                                    Image.asset(
                                      item.image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 30),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            )
          : const Center(child: Text('Empty Page')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blueGrey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
