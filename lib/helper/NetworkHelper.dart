import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper {
  final String timeUrl = 'https://drowsinessdetectionapi.herokuapp.com/';
  final String heartRateUrl = 'https://drowsinessdetectionapi.herokuapp.com/heartRate.php';

  Future<List<dynamic>> getTimeData() async {
   var response = await http.get(timeUrl);
   if (response.statusCode == 200) {
     final jsonResponse = json.decode(response.body);
     return jsonResponse;
   } else {
     throw Exception('Something Went Wrong!');
   }
 }

  Future<List<dynamic>> getHeartRateData() async {
    var response = await http.get(heartRateUrl);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Something Went Wrong!');
    }
  }

}