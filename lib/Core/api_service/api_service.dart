import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Response> postData(
      {Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    _dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization':'key=AAAAgEHr1Tg:APA91bEdZuvf4wxPyl3T3Edk7ITNOv5afE8lvWMzYcmqzI2mla6E9MGBJ4zGSm8GrRMAseLNngE1Q51VDDTpsD8soiw3CKwsd-2owXHsyGf3phjwqCzntwWEzzHLXXf1pKwJMZzWCih0'
    };
    return await _dio.post('send', queryParameters: query, data: data);
  }
}
