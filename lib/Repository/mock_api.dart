
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:dio/dio.dart';
class MockApi {
  static final dio = Dio();
  static final dioAdapter = DioAdapter(dio: dio);

  static void setupMockClient() {
    dio.httpClientAdapter = dioAdapter;

    // Set up mock responses
    dioAdapter.onGet(
      '/posts',
      (server) => server.reply(
        200,
        [
          {'id': 1, 'title': 'Springbank\n1992#1234','image':'asset/product.png'},
          {'id': 2, 'title': 'Talisker 18 year old\n#2504','image':'asset/bottle.png'},
          {'id': 3, 'title': 'Springbank\n1992#1234','image':'asset/bottle.png'},
          {'id': 4, 'title': 'Talisker 18 year old\n#2504','image':'asset/bottle.png'},
          // Add more mock items if needed
        ],
      ),
    );
  }
}