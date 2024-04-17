// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/appCubitState.dart';
import 'package:travel/cubit/appCubits.dart';
import 'package:travel/widgets/largeText.dart';
import 'package:travel/widgets/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var iconsData = {
    "assets/peace.png": "Peace",
    "assets/adventure.png": "Adventure",
    "assets/culture.png": "Cultural",
    "assets/spiritual.png": "Spiritual",
    "assets/mountain.png": "Mountains",
  };
  List img = [
    "assets/photo1.png",
    "assets/photo2.png",
    "assets/photo3.png",
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/min.png"),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange.shade100,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.all(6),
                  alignment: Alignment.topLeft,
                  child: LargeText(
                    text: "Discover",
                    color: Colors.black54,
                  ),
                ),
                //tabBar
                Container(
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 10, right: 20),
                    labelColor: Colors.black,
                    controller: _tabController,
                    unselectedLabelColor: Colors.blueGrey,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicator:
                        CircleIndicator(color: Colors.black54, radius: 4),
                    tabs: [
                      Tab(text: "Places"),
                      Tab(text: "Inspirations"),
                      Tab(text: "Emotions"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(right: 13, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(info[index].url)),
                              ),
                            );
                          }),
                      Text("there"),
                      Text("hello"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LargeText(
                          text: "Explore More",
                          size: 21,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: AppText(
                          text: "see all",
                          size: 15,
                          color: Colors.blue.shade200,
                        ),
                      ),
                    )
                  ],
                ),

                Container(
                  width: double.maxFinite,
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: iconsData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 5,
                                right: 40,
                              ),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      iconsData.keys.elementAt(index)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              child: AppText(
                                  text: iconsData.values.elementAt(index)),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleIndicator extends Decoration {
  final Color color;
  double radius;
  CircleIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CirclePinter(color: color, radius: radius);
  }
}

class CirclePinter extends BoxPainter {
  final Color color;
  double radius;

  CirclePinter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    _paint.isAntiAlias = true;
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
