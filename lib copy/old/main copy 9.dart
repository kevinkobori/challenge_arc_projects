import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/index_controller.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/parallax.dart';
import 'package:flutter_card_swipper/widgets/transformer_page_view/transformer_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remottely',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;
  SwiperController _swiperController = SwiperController();
  SwiperController _swiperController2 = SwiperController();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final valueNotifier = ValueNotifier<bool>(false);

  static const _duration = Duration(milliseconds: 400);
  @override
  Widget build(BuildContext context) {
    var total = (isActive1 ? 6 : 4) +
        (isActive2 ? 6 : 4) +
        (isActive3 ? 6 : 4) +
        (isActive4 ? 6 : 4);
    var width = MediaQuery.of(context).size.width;
    var width1 = (width * (isActive1 ? 6 : 4)) / total;
    var width2 = (width * (isActive2 ? 6 : 4)) / total;
    var width3 = (width * (isActive3 ? 6 : 4)) / total;
    var width4 = (width * (isActive4 ? 6 : 4)) / total;
    List<Widget> images1 = [
      Container(
        color: Colors.black,
        // height: 200,
        // width: 200,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isActive1 = value;
                });
              },
              child: AnimatedContainer(
                height: MediaQuery.of(context).size.height,
                width: width1,
                duration: _duration,
                color: isActive1 ? Colors.white : Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HOME",
                      style: TextStyle(
                        // fontFamily: ,
                        color: isActive1 ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isActive2 = value;
                });
              },
              child: AnimatedContainer(
                width: width2,
                duration: _duration,
                color: isActive2 ? Colors.white : Colors.black,
              ),
            ),
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isActive3 = value;
                });
              },
              child: AnimatedContainer(
                width: width3,
                duration: _duration,
                color: isActive3 ? Colors.white : Colors.black,
              ),
            ),
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isActive4 = value;
                });
              },
              child: AnimatedContainer(
                width: width4,
                duration: _duration,
                color: isActive4 ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
      Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/bg1.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          InkWell(
            onTap: () {},
            onHover: (value) {
              valueNotifier.value = value;
              // setState(() {
              // isActive5 = value;
              // });
            },
            child: ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (context, value, child) {
                  if (valueNotifier.value) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                  return
                      // AnimatedOpacity(
                      //   opacity: valueNotifier.value ? 0.6: 0,
                      //   duration: _duration,
                      //   child:
                      Container(
                    color: Colors.white.withOpacity(0.6),
                    child: FadeTransition(
                      opacity: _animation,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: valueNotifier.value ? 10 : 1,
                              sigmaY: valueNotifier.value ? 10 : 1),
                          child: Container(
                            // duration: _duration,
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height,
                            // color: Colors.white.withOpacity(0.6),
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: valueNotifier.value ? 10 : 0,
                                    sigmaY: 10),
                              ),
                            ),
                          ),
                        ),
                        // ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      Container(
        color: Colors.black,
      ),
    ];
    List<Widget> images2 = [
      Container(
        color: Colors.black,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
    ];
    List<Widget> images3 = [
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/bg1.jpg',
        fit: BoxFit.cover,
      ),
    ];
    List<List<Widget>> lists = [images1, images2, images3];
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     TextButton(
      //       onPressed: () async {
      //         _swiperController.move(1);
      //         await Future.delayed(Duration(milliseconds: 300))
      //             .then((value) => _swiperController2.move(1));
      //       },
      //       child: Icon(Icons.menu),
      //     ),
      //   ],
      // ),
      body: Container(
        color: Colors.grey[900],
        // height: MediaQuery.of(context).size.height ,
        // width: MediaQuery.of(context).size.width,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Swiper(
              fade: 0,
              outer: true,
              itemBuilder: (BuildContext context, int index2) {
                return lists[index][index2];
              },
              loop: false,
              scrollDirection: Axis.vertical,
              controller: _swiperController2,
              itemCount: lists[0].length,
            );
          },
          fade: 0,
          outer: true,
          loop: false,
          scrollDirection: Axis.horizontal,
          controller: _swiperController,
          itemCount: lists.length,
        ),
      ),
    );
  }
}
