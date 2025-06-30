import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  final _API_URL = Uri.parse("http://animalitospharma-001-site1.ltempurl.com");

  // Future<http.Response> apiHelperRequest(String methodHTTP, String target, dynamic body, ) async {
  //   http.Response request = Response({}, 400);

  //   switch(methodHTTP){
  //     case 'READ':
  //     request = await http.get(
  //         _API_URL,
  //         headers: {'Content-Type': 'application/json'}
  //     );
  //       break;
  //     case 'READ_ALL':
  //       break;
  //     case 'CREATE':
  //       break;
  //     case 'UPDATE':
  //       break;
  //     case 'DELETE':
  //       break;
  //   }
  //   return request;
  // }
}