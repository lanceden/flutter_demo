import 'dart:io';
import 'package:dio/dio.dart';
import 'Urls.dart';

class Api {

  // 取回預覽圖
  static Future queryBanner() async{
    Response response;
    response = await Dio().post('$bannerUrl');
    if(response.statusCode == HttpStatus.ok) {
      print('queryBanner: ${response.data}');
      return response.data;
    }
  }
  // 取回最新消息
  static Future queryNews() async{
    Response response;
    response = await Dio().post('$newsUrl');
    if(response.statusCode == HttpStatus.ok) {
      print('queryNews: ${response.data}');
      return response.data;
    }
  }
  // 取回教練資訊
  static Future queryCoach() async{
    Response response;
    response = await Dio().post('$coachUrl');
    if(response.statusCode == HttpStatus.ok) {
      print('queryCoach: ${response.data}');
      return response.data;
    }
  }
}