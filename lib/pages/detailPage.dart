import 'package:flutter/material.dart';
import 'package:travel/widgets/appButtons.dart';
import 'package:travel/widgets/largeText.dart';
import 'package:travel/widgets/responsiveButton.dart';
import 'package:travel/widgets/text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              child: Container(
            width: double.maxFinite,
            height: 330,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/photo1.png"),
                fit: BoxFit.cover,
              ),
            ),
          )),
          Positioned(
              top: 10,
              // left: 10,
              width: double.maxFinite,
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.more_vert_rounded)),
                      ),
                    ]),
              )),
          Positioned(
            top: 300,
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: LargeText(
                            text: "Mt. Everest treck",
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: LargeText(
                            text: "250\$",
                            color: Colors.blue.shade600,
                            size: 21,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        AppText(
                          text: "Koshi,Solukhumbu",
                          color: Colors.blue.shade400,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? Colors.yellow.shade400
                                  : Colors.black38,
                            );
                          }),
                        ),
                        AppText(
                          text: "(5.0)",
                          size: 12,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    LargeText(text: "People", size: 20),
                    AppText(
                      text: "Know people who join along with you",
                      size: 14,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return Material(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: AppButton(
                                text: "${index + 1}",
                                size: 50,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey.shade200,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    LargeText(
                      text: "Descriptiopn",
                      size: 18,
                    ),
                    SizedBox(height: 10),
                    AppText(text: '''
Mount Everest is Earth's highest mountain above sea level
(8,848.86 m) located in the Mahalangur Himal sub-range of the Himalayas
'''),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 40,
              left: 20,
              child: Row(
                children: [
                  AppButton(
                      isIcon: true,
                      appIcon: Icons.favorite_outline_outlined,
                      size: 50,
                      color: Colors.black,
                      backgroundColor: Colors.grey.shade100),
                  SizedBox(width: 150),
                  Button(
                    width: 200,
                  ),
                ],
              ))
        ],
      ),
      // ),
    );
  }
}
