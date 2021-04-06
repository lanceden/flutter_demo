import 'package:flutter/material.dart';
import 'package:flutter_app/Api/Api.dart';
import 'package:flutter_app/Model/Banners.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Banners banners;
  int bannersLength = 0;

  void Test() {
    Api.queryBanner().then((value) {
      banners = Banners.fromJson(value);
      bannersLength = banners.data.result.length;
    });
  }

  @override
  void initState() {
    super.initState();
    Test();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('首頁'),
      ),
      body: ListView.builder(
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
              ],
            );
          }
          return Container(
            child: Text('13'),
          );
        },
        itemCount: 3,
      ),
    );
  }
}

