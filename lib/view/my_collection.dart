import 'package:flutter/material.dart';
import 'package:flutter_application_2/Repository/mock_api.dart';
import 'package:flutter_application_2/model/item.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/view/detail.dart';

class MyCollection extends StatefulWidget {
  const MyCollection({super.key});

  @override
  State<MyCollection> createState() => _MyCollectionState();
}

class _MyCollectionState extends State<MyCollection> {
  int _selectedIndex = 0;
  Future<List<Item>> _fetchItems() async {
    try {
      final response = await MockApi.dio.get('/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff0B1519),
      appBar: AppBar(backgroundColor: Color(0xff0B1519),foregroundColor: Colors.white,
        title: Text('My collection'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              // Handle icon button press
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<List<Item>>(
                future: _fetchItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    final items = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .65,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = items[index];
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
                                    
                                    SizedBox(height: 30,),
                                      Image.asset(
                                item.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                                            ),
                                                             SizedBox(height: 30,),
                                     Align(alignment: Alignment.centerLeft,
                                       child: Text(
                                          item.title,
                                          style: TextStyle(
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
                    );
                  }
                },
              ),
          )
          : Center(child: Text('Empty Page')),
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

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildGridView(); // Display GridView for Home
      case 1:
      case 2:
      case 3:
        return Center(
            child: Text('Empty Page')); // Display empty page for other tabs
      default:
        return Center(child: Text('No Content'));
    }
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
