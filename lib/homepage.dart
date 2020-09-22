import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle headerStyle = TextStyle(color: Colors.blueGrey, fontSize: 16);
  TextStyle dropDownStyle = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );

  List<String> gradeValue = [];
  List<String> creditValue = [];

  final List<String> grades = ["S", "A", "B", "C", "D", "E", "F"];
  final List<String> credits = ["1", "2", "3", "4"];

  @override
  void initState() {
    for (int i = 0; i < 15; i++) {
      gradeValue.add("S");
    }
    for (int i = 0; i < 15; i++) {
      creditValue.add("1");
    }
    super.initState();
  }

  void onGradeSelect(String value, int index) {
    setState(() {
      gradeValue[index] = value;
    });
  }

  void onCreditSelect(String value, int index) {
    setState(() {
      creditValue[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 310,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 35),
                //  color: Colors.yellow,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: Offset(10, 10),
                          blurRadius: 10),
                      BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(-10, -10),
                          blurRadius: 10),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: header(),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      widthFactor: 6.7,
                      child: IconButton(
                          icon: Icon(
                            Icons.add_circle_rounded,
                            color: Colors.black.withOpacity(0.7),
                            size: 28,
                          ),
                          onPressed: () {
                            HapticFeedback.lightImpact();
                          }),
                    )
                  ],
                ),
              ),
              Container(
                height: 220,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 45),
                //  color: Colors.red,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                      entry(1),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NeumorphicButton(
                  provideHapticFeedback: true,
                  child: Text("Calculate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    intensity: 40,
                    depth: 50,
                    shape: NeumorphicShape.concave,
                  ),
                ),
                NeumorphicButton(
                  provideHapticFeedback: true,
                  child: Text("Reset",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 16)),
                  onPressed: () {},
                  style: NeumorphicStyle(
                      intensity: 20, depth: 50, shape: NeumorphicShape.concave),
                )
              ],
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Container(
            height: 140,
            child: SfRadialGauge(
              //  title: GaugeTitle(text: "CGPA"),
              axes: <RadialAxis>[
                RadialAxis(
                  showTicks: false,
                  showLabels: false,
                    minimum: 0,
                    maximum: 10,
                    interval: 1,
                    radiusFactor: 1.25,
                    pointers: <GaugePointer>[
                      RangePointer(
                        enableAnimation: true,
                        color: Colors.indigo,
                        value: 7.694
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text(
                        "7.694",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black),
                      ))
                    ]),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "#",
          style: headerStyle,
        ),
        Text("Grade", style: headerStyle),
        Text("Credit", style: headerStyle)
      ],
    );
  }

  Widget entry(int id) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      width: double.infinity,
      color: Color.fromRGBO(238, 238, 238, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(id.toString()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  style: dropDownStyle,
                  items: grades.map((item) {
                    return DropdownMenuItem<String>(
                      child: Text(item),
                      value: item,
                    );
                  }).toList(),
                  value: gradeValue[id - 1],
                  onChanged: (value) => onGradeSelect(value, id - 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  elevation: 4,
                  style: dropDownStyle,
                  items: credits.map((item) {
                    return DropdownMenuItem<String>(
                      child: Text(item),
                      value: item,
                    );
                  }).toList(),
                  value: creditValue[id - 1],
                  onChanged: (value) => onCreditSelect(value, id - 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
