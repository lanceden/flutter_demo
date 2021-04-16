import 'package:flutter/material.dart';
import 'package:flutter_app/Api/Api.dart';
import 'package:flutter_app/Model/Banners.dart';
import 'package:flutter_app/Model/News.dart';
import 'package:flutter_app/home/news_detail.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Banners banners;
  int bannersLength = 0;

  News news;
  int newsLength = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('首頁'),
      ),
      body: FutureBuilder(
        future: Future.wait([
          Api.queryBanner(),
          Api.queryNews()
        ]),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          banners = Banners.fromJson(snapshot.data[0]);
          bannersLength = banners.data.result.length;
          news = News.fromJson(snapshot.data[1]);
          newsLength = news.data.result.length;

          return
            ListView.builder( // 讓首頁可以上下滾動
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //       color: Colors.red, width: 5.0, style: BorderStyle.solid),
                        // ),
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              "${banners.data.result[index].bannerImageName}",
                              fit: BoxFit.fill,
                            );
                          },
                          duration:1000,
                          itemCount: bannersLength,
                          itemWidth: width,
                          itemHeight: 300,
                          layout: SwiperLayout.STACK,
                          autoplay:true,
                          pagination: SwiperPagination(),
                          control: SwiperControl(),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Icon(Icons.map),
                          SizedBox(width: 20,),
                          Text('臺北市松山區光復北路11巷33號', style: TextStyle(fontSize: 18,),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Icon(Icons.phone),
                          SizedBox(width: 20,),
                          Text('0912345678', style: TextStyle(fontSize: 18,),),
                        ],
                      ),
                      Divider(),
                      Container(
                        color: Colors.black,
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.fiber_new,
                                color: Colors.yellow),
                            SizedBox(width: 20,),
                            Text('最新消息', style: TextStyle(
                                fontSize: 22,
                                color: Colors.white
                            ),),
                          ],
                        ),
                      )
                    ],
                  );
                }
                // 還有GestureDetector可參考
                return InkWell(
                  // 最新消息列表
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.whatshot),
                              Text('${news.data.result[index].newsFirstTitle}', style: TextStyle(fontSize: 18,),)
                            ],
                          )
                      ),
                      SizedBox(height: 20,),
                      Container(
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('${news.data.result[index].newsSecTitle}', style: TextStyle(fontSize: 18,),)
                            ],
                          )
                      ),
                      Divider(color: Colors.black,)
                    ],
                  ),
                  // 最新消息點擊事件
                  onTap: () {
                    final passData = news.data.result[index];
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => NewsDetail(passData)));
                  },
                );
              },
              itemCount: newsLength,
            );
        },
      )
    );

  }
}

