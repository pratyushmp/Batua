import 'package:awesome_slider/awesome_slider.dart';
import 'package:batua/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';

class CreateGoalPage extends StatefulWidget {
  @override
  _CreateGoalPageState createState() => _CreateGoalPageState();
}

class _CreateGoalPageState extends State<CreateGoalPage> {
  double _saveAmountValue = 1.0, _monthlyContributionValue = 1.0, noOfMonth = 0;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final double _height = _mediaQuery.size.height;
    final double _width = _mediaQuery.size.width;

    return Scaffold(
      backgroundColor: primary_color,
      body: ListView(
        children: [
          SizedBox(
            height: _height * 0.06,
          ),
          Row(
            children: [
              SizedBox(
                width: _width * 0.07,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              SizedBox(
                width: _width * 0.3,
              ),
              const Text(
                'Step 2',
                style: TextStyle(
                  color: Color(
                    0xFF4731ee,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: _height * 0.06,
              left: _width * 0.11,
            ),
            child: const Text(
              "Let's create your",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: _width * 0.11,
              bottom: _height * 0.08,
            ),
            child: const Text(
              "saving goal!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: _width * 0.01,
                ),
                height: _height * 0.9,
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: _height / 41,
                  left: _height / 41,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      40,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    _cardBuilder(
                      width: _width,
                      height: _height,
                      cardTitle: 'Amount to save',
                      first: true,
                    ),
                    const Divider(
                      endIndent: 20,
                    ),
                    _cardBuilder(
                      height: _height,
                      width: _width,
                      cardTitle: 'Your monthly contribution',
                      first: false,
                    ),
                  ],
                ),
              ),
              Container(
                height: _height * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF4731ee),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      60,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: _height * 0.06,
                      ),
                      child: Text(
                        'You will save ${_saveAmountValue.toStringAsFixed(2)} by',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      Jiffy().add(months: noOfMonth.toInt()).yMMMM,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppin-Regular',
                      ),
                    ),
                    SizedBox(
                      height: _height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.only(
                          top: _height / 41,
                          bottom: _height / 41,
                          left: _width / 4.5,
                          right: _width / 4.5,
                        ),
                      ),
                      child: const Text(
                        '+ Create a goal',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _cardBuilder({
    double width,
    double height,
    String cardTitle,
    bool first,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            top: height * 0.02,
          ),
          child: Text(
            cardTitle,
            style: const TextStyle(
              color: Color(0xFF8E94AD),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          // ignore: prefer_const_literals_to_create_immutables
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
              first
                  ? _saveAmountValue.toStringAsFixed(2)
                  : _monthlyContributionValue.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: 'Poppins-Regular',
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        AwesomeSlider(
          value: first ? _saveAmountValue : _monthlyContributionValue,
          min: 1.0,
          max: 1000.0,
          thumbColor: const Color(0xFF4731ee),
          roundedRectangleThumbRadius: 20,
          thumbSize: 50.0,
          activeLineStroke: 2.0,
          activeLineColor: Colors.blueAccent,
          inactiveLineColor: Colors.grey,
          sliderWidth: 300,
          // ignore: sort_child_properties_last
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 10.0,
              ),
              const SizedBox(width: 10.0),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 10.0,
              )
            ],
          ),
          onChanged: (double value) {
            setState(
              () {
                first
                    ? _saveAmountValue = value
                    : _monthlyContributionValue = value;
                noOfMonth = _saveAmountValue / _monthlyContributionValue;
              },
            );
          },
        ),
      ],
    );
  }
}
