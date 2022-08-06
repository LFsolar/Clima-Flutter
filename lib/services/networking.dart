// Networks with Openweathermap API

import 'package:http/http.dart' as http;
import 'dart:convert'; // for decoding json

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  // get API data
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
