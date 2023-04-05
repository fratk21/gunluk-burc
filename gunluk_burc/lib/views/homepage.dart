import 'package:flutter/material.dart';

import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:gunluk_burc/model/datas.dart';
import 'package:gunluk_burc/model/web.dart';
import 'package:gunluk_burc/views/constants.dart';
import 'package:gunluk_burc/views/detailsview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<PlanetInfo>? planet;
  bool isloading = false;
  void gel() async {
    setState(() {
      isloading = true;
    });
    planet = await web().fetchburc();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    gel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [gradientStartColor, gradientEndColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: const [
                            Text(
                              'Explore',
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 40,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Swiper(
                        itemCount: planet!.length,
                        fade: 0.3,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                        layout: SwiperLayout.STACK,
                        pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                activeSize: 20,
                                activeColor: Colors.yellow.shade300,
                                space: 5)),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (context, a, b) => DetailsView(
                                      planetInfo: planet![index],
                                    ),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ));
                            },
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      elevation: 8,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 100,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 32.0),
                                              child: Text(
                                                planet![index].name.toString(),
                                                style: const TextStyle(
                                                    fontSize: 40,
                                                    fontFamily: 'Avenir',
                                                    color: Color(0xff47455f),
                                                    fontWeight:
                                                        FontWeight.w900),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 22.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Know more",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Avenir',
                                                        color:
                                                            secondaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_rounded,
                                                    color: secondaryTextColor,
                                                    size: 18,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Hero(
                                    tag: planet![index].position,
                                    child: Image.asset(
                                      planet![index].iconImage.toString(),
                                      scale: 1,
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )),
            ),
    );
  }
}
