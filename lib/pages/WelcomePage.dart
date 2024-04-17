import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/appCubits.dart';
import 'package:travel/misc/appColor.dart';
import 'package:travel/widgets/largeText.dart';
import 'package:travel/widgets/responsiveButton.dart';
import 'package:travel/widgets/text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List img = [
    "assets/photo1.png",
    "assets/photo2.png",
    "assets/photo3.png",
  ];
  List texts = [
    '''Climb the mountain not to plant your flag,
but to embrace the challenge, enjoy the air and behold the view.
Climb it so you can see the world, not so the world can see you''',
    '''
The more variety, the better society. Let's All Culture Coexist better.
Understand the differences; Act on the commonalities. Equality for diversity in this world.
''',
    '''
Kathmandu,The city of temples where you will find Stupas Temples Church Monastries all in same place
Here , you can truly feel the cultural diversity
'''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: img.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeText(text: "Trips", color: Colors.white),
                        AppText(text: "Nepal", size: 30, color: Colors.white),
                        Container(
                          width: 250,
                          child: AppText(
                            color: AppColors.textColor1,
                            text: texts[index],
                            size: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                            child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Button(width: 200),
                        )),
                      ],
                    ),
                    Column(
                        children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.all(1),
                        width: 6,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? Colors.blueGrey
                              : Colors.white,
                        ),
                      );
                    }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
