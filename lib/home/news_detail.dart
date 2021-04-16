import 'package:flutter/material.dart';
import 'package:flutter_app/Model/News.dart';
import 'package:flutter_html/flutter_html.dart';

import 'img_screen.dart';

// 最新消息詳細資料
class NewsDetail extends StatelessWidget {
  Result result;

  NewsDetail(this.result) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新消息'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Center(
              child: Hero(
                tag: 'imageHero',
                child: Image.network(
                  '${result.newsImgUrl}',
                  height: 400,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ImgScreen('${result.newsImgUrl}');
              }));
            },
          ),
          Padding(
              padding: EdgeInsets.only(left: 16),
              child: Html(
                data: result.newsContent,
                onLinkTap: (url) {
                  print('$url');
                },
              )
          )
        ],
      ),
    );
  }
}
