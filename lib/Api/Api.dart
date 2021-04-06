import 'dart:io';
import 'package:dio/dio.dart';
import 'Urls.dart';

class Api {

  // 取回預覽圖
  static Future queryBanner() async{
    Response response;
    response = await Dio().post('$bannerUrl');
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }
  // 取回最新消息
  static Future queryNews() async{
    Response response;
    response = await Dio().post('$newsUrl');
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }
}