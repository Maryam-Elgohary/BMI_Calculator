import 'package:flutter/material.dart';

class Result {
  Result({
    required this.state,
    required this.result,
    required this.statement,
  });

  String state;
  String result;
  String statement;
}

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  late Result bmiResult;
  final double result;

  ResultScreen(this.result, {Key? key}) : super(key: key) {
    bmiResult = getBMIResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D2136),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Your Result",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            bmiResult.state.toUpperCase(),
                            style: TextStyle(
                                color: result > 24.9 || result < 18.6
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 26),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            bmiResult.result.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            bmiResult.statement,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: const Color(0xffE83D66),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Re-Calculate".toUpperCase(),
                      style: const TextStyle(
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
      ),
    );
  }

  Result getBMIResult(double res) {
    if (res < 18.6) {
      return Result(
          state: "Under-Weight",
          result: res.toStringAsFixed(1),
          statement: "You are under-weight!");
    } else if (res > 24.9) {
      return Result(
          state: "Over-Weight",
          result: res.toStringAsFixed(1),
          statement: "You are over-weight!");
    } else {
      return Result(
          state: "Normal",
          result: res.toStringAsFixed(1),
          statement: "You have a normal body weight. Good Job!");
    }
  }
}
