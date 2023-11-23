import 'package:bmi_calculator_app/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;

  String gender = " ";

  late double BMI = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 216, 104, 104),
          shadowColor: Colors.yellow,
          title: const Text("BMI Calculator",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = "M";
                            });
                          },
                          child: Container(
                            height: 140,
                            width: 130,
                            decoration: BoxDecoration(
                                color: gender == "M"
                                    ? Colors.orange.withAlpha(150)
                                    : Colors.orange.withAlpha(50),
                                borderRadius: BorderRadius.circular(25)),
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Icon(Icons.male, size: 70, color: Colors.blue),
                                Text(
                                  "Male",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = "F";
                            });
                          },
                          child: Container(
                            height: 140,
                            width: 130,
                            decoration: BoxDecoration(
                                color: gender == "F"
                                    ? Colors.orange.withAlpha(150)
                                    : Colors.orange.withAlpha(50),
                                borderRadius: BorderRadius.circular(25)),
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Icon(Icons.female,
                                    size: 70, color: Colors.pink),
                                Text("Female", style: TextStyle(fontSize: 20))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text("Height"),
                              Text("$height", style: kInputLabelColor),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        if (height > 50) {
                                          BMI = calculateBMI(
                                              height: height, weight: weight);
                                          height++;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        if (height < 220) {
                                          BMI = calculateBMI(
                                              height: height, weight: weight);
                                          height--;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text("Weight"),
                              Text("$weight", style: kInputLabelColor),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 30) {
                                          BMI = calculateBMI(
                                              height: height, weight: weight);
                                          weight++;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        if (weight < 300) {
                                          BMI = calculateBMI(
                                              height: height, weight: weight);
                                          weight--;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text("BMI", style: TextStyle(fontSize: 20)),
                        Text(
                          "${BMI.toStringAsFixed(2)}",
                          style: kInputLabelColor.copyWith(
                              color: Color.fromARGB(255, 185, 41, 31),
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(getResult(BMI), style: TextStyle(fontSize: 20))
                      ],
                    )
                  ],
                )),
          ),
        ));
  }

  double calculateBMI({required int height, required int weight}) {
    return weight * 10000 / (height * height);
  }

  static String getResult(BMI) {
    if (BMI >= 25) {
      return "Overweight";
    } else if (BMI >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
