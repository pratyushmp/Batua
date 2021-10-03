

import 'package:batua/models/icon_item.dart';
import 'package:batua/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateGoalPage1 extends StatefulWidget {
  @override
  _CreateGoalPage1State createState() => _CreateGoalPage1State();
}

class _CreateGoalPage1State extends State<CreateGoalPage1> {
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final double _height = _mediaQuery.size.height;
    final double _width = _mediaQuery.size.width;
    return Scaffold(
      floatingActionButton: floatingActionButtonBuilder(ctx: context),
      backgroundColor: primary_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: _height / 25,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: _width * 0.03,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: _width * 0.28,
                  ),
                  const Text(
                    'Step 1',
                    style: TextStyle(
                      color: Color(
                        0xFF4731ee,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: secondary_color,
                  ),
                  child: TextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEBEBEB),
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFEBEBEB),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFEBEBEB),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      hintText: "Title",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _height / 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'For what do you want to save ?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_height / 53),
                child: Container(
                  height: _height / 2.7,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                  ),
                  child: GridView.builder(
                    itemCount: iconItemList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 130,
                    ),
                    itemBuilder: (_, int index) {
                      final IconItem item = iconItemList[index];
                      return gridItem(
                        footer: item.footer,
                        iconData: item.iconData,
                        color: item.selected ? Colors.grey : primary_color,
                        item: item,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridItem({
    required String footer,
    required IconData iconData,
    required Color color,
    required IconItem item,
  }) =>
      GestureDetector(
        onTap: () {
          setState(() {
            if (item.selected) {
              item.selected = false;
            } else {
              for (final element in iconItemList) {
                if (element.selected) {
                  element.selected = false;
                }
              }
              item.selected = true;
            }
          });
        },
        child: Container(
          height: 100,
          width: 50,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                iconData,
                size: 40,
              ),
              Text(
                footer,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  Widget floatingActionButtonBuilder({BuildContext? ctx}) => InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => Navigator.of(ctx!).pushNamed(
          RouteConstants.createGoalPage2,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(3, 3),
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.8),
              )
            ],
            color: secondary_color,
            borderRadius: BorderRadius.circular(30),
          ),
          width: 150,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text(
                'Step 2',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
}
