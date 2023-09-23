import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button(
      {Key? key,
      required this.label,
      required this.value,
      required this.onMinusPressed,
      required this.onPlusPressed})
      : super(key: key);
  String label;
  int value;
  void Function() onMinusPressed;
  void Function() onPlusPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff323244),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white70, fontSize: 25),
                  ),
                  Text(
                    value.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white54,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onMinusPressed,
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white54,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onPlusPressed,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
