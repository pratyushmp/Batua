import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:batua/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';
import 'google_signin.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final iconList = <IconData>[
    Icons.access_time_rounded,
    Icons.person,
  ];
  String amount = "30.500";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondary_color,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
            isScrollControlled: true,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          height: 90,
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? secondary_color : secondary_color;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            );
          },
          backgroundColor: Colors.white,
          gapLocation: GapLocation.center,
          activeIndex: activeIndex,
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          }),
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "You've already saved:",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                              color: Color(0xFF4731ee),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            amount,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Your goals",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text(
                      "All",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Achieved",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),

            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: cardData.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    IconData ic = index == 0
                        ? Icons.home
                        : index == 1
                            ? Icons.flight
                            : Icons.umbrella;
                    var val =
                        double.parse(cardData[index]["c_amount"].toString());
                    var max =
                        double.parse(cardData[index]["t_amount"].toString());
                    return Column(
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: primary_color,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    ic,
                                    color: secondary_color,
                                  ),
                                ),
                                top: 30,
                                left: 30,
                              ),
                              Positioned(
                                child: Text(
                                  cardData[index]["Task"].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                top: 25,
                                left: 90,
                              ),
                              Positioned(
                                child: Text(
                                  "\$ ${cardData[index]["c_amount"].toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                                bottom: 20,
                                left: 30,
                              ),
                              Positioned(
                                child: Text(
                                  "\$ ${cardData[index]["t_amount"].toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                                bottom: 20,
                                right: 25,
                              ),
                              Positioned(
                                child: Text(
                                  "\$ ${cardData[index]["T_rem"].toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: text_accent_primary,
                                  ),
                                ),
                                top: 57,
                                left: 90,
                              ),
                              Positioned(
                                child: Container(
                                  child: SliderTheme(
                                    child: Slider(
                                      value: val,
                                      min: 0,
                                      max: max,
                                    ),
                                    data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: secondary_color,
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 2)),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                ),
                                left: 10,
                                bottom: 30,
                                right: 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var cardData = [
  {
    "Icon": Icons.home,
    "Task": "New home",
    "T_rem": "9 months left",
    "c_amount": "15.500",
    "t_amount": "37.500",
  },
  {
    "Icon": Icons.flight,
    "Task": "Trip to Iceland",
    "T_rem": "2 months left",
    "c_amount": "8.500",
    "t_amount": "10.000",
  },
  {
    "Icon": Icons.umbrella,
    "Task": "Rainy day",
    "T_rem": "4 months left",
    "c_amount": "5.000",
    "t_amount": "7.000",
  },
];
