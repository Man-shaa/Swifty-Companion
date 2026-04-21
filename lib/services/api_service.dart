// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _authUrl = 'https://api.intra.42.fr/oauth/token';

  Future<String?> getAccessToken() async {
    try {
      final String uid = dotenv.get('UID');
      final String secret = dotenv.get('SECRET');

      final response = await _dio.post(
        _authUrl,
        data: {
          'grant_type': 'client_credentials',
          'client_id': uid,
          'client_secret': secret,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data['access_token'];
        print('--- 42 API SUCCESS ---');
        print('Token: $token');
        return token;
      }
    } on DioException catch (e) {
      print('--- 42 API ERROR ---');
      print('Status: ${e.response?.statusCode}');
      print('Message: ${e.response?.data}');
    }
    return null;
  }
}