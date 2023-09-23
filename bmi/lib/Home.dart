import 'dart:math';
import 'Button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double thumbValue = 100.0;
  int weightValue = 30;
  int ageValue = 1;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1D2136),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = true;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: isMale
                                    ? const Color(0xFF323244)
                                    : const Color(0xff24263B),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.mars,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "MALE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: !isMale
                                    ? const Color(0xFF323244)
                                    : const Color(0xff24263B),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.venus,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "FEMALE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF323244),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "HEIGHT",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 26),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          thumbValue.toInt().toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Text(
                                          "cm",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Slider(
                                      value: thumbValue,
                                      min: 50,
                                      max: 200,
                                      thumbColor: const Color(0xffE83D66),
                                      activeColor: const Color(0xffE83D66),
                                      inactiveColor: Colors.grey,
                                      onChanged: (newValue) {
                                        setState(() {
                                          thumbValue = newValue;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        Button(
                          label: "WEIGHT",
                          value: weightValue,
                          onMinusPressed: () {
                            setState(() {
                              weightValue--;
                            });
                          },
                          onPlusPressed: () {
                            setState(() {
                              weightValue++;
                            });
                          },
                        ),
                        Button(
                          label: "AGE",
                          value: ageValue,
                          onPlusPressed: () {
                            setState(() {
                              ageValue++;
                            });
                          },
                          onMinusPressed: () {
                            setState(() {
                              ageValue--;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final double result =
                          weightValue / pow(thumbValue / 100, 2);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(result)));
                    },
                    child: Container(
                      color: const Color(0xffE83D66),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          " CALCULATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
