import 'package:dio/dio.dart';

class ApiServices {
  final String baseUrl ='https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiServices({required this.dio});

  ///// Get Methods
  Future<Map<String, dynamic>> get(String endpoint) async {
    final Response response = await dio.get('$baseUrl$endpoint');
    return response.data;
    
  } 

}