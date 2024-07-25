
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/model/item.dart';

class DetailPage extends StatelessWidget {
  final Item item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff0B1519),
        appBar: AppBar(
           backgroundColor: Color(0xff0B1519),
         foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    item.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Details for ${item.title}',
                    style: TextStyle(fontSize: 24,color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            TabBar(labelColor: Color(0xffD49A00),unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: 'Details',),
                Tab(text: 'Tasting Notes'),
                Tab(text: 'History'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DetailsTab(item: item),
                  TastingNotesTab(),
                  HistoryTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  final Item item;

  DetailsTab({required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'More details about ${item.title}.',
          style: TextStyle(fontSize: 18,color: Colors.white),
        ),
      ),
    );
  }
}

class TastingNotesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Tasting notes content goes here.',
          style: TextStyle(fontSize: 18,color: Colors.white),
        ),
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'History content goes here.',
          style: TextStyle(fontSize: 18,color: Colors.white),
        ),
      ),
    );
  }
}
// class DetailPage extends StatelessWidget {
//   final Item item;

//   DetailPage({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff0B1519),
//       appBar: AppBar(
//         backgroundColor: Color(0xff0B1519),
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 item.image,
//                 width: 200,
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//               Container(
//                 color: const Color(0xff122329),
//                 height: 500,
//                 width: MediaQuery.of(context).size.width * .85,
//                 child: Column(
//                   children: [
//                     Text(
//                       'Details for ${item.title}',
//                       style: TextStyle(fontSize: 22, color: Color(0xffD49A00)),
//                     ),
//                     TabBar(
//                       tabs: [
//                         Tab(text: 'Details'),
//                         Tab(text: 'Tasting Notes'),
//                         Tab(text: 'History'),
//                       ],
//                     ),
//                     TabBarView(
//           children: [
//             DetailsTab(item: item),
//             TastingNotesTab(),
//             HistoryTab(),
//           ],
//         ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class DetailsTab extends StatelessWidget {
//   final Item item;

//   DetailsTab({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
        
//           SizedBox(height: 20),
//           Text(
//             'Details for ${item.title}',
//             style: TextStyle(fontSize: 24),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TastingNotesTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           'Tasting notes content goes here.',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

// class HistoryTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           'History content goes here.',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }