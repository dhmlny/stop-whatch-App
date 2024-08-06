// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: StopwhatchApp(),
    );
  }
}

class StopwhatchApp extends StatefulWidget {
  const StopwhatchApp({super.key});

  @override
  State<StopwhatchApp> createState() => _StopwhatchAppState();
}

class _StopwhatchAppState extends State<StopwhatchApp> {
  Timer? repeated;
  Duration duration = Duration(seconds: 0);
  bool isRunning = false;

  startTimer() {
    repeated = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int newSecond = duration.inSeconds + 1;
        duration = Duration(seconds: newSecond);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: SizedBox(
        height: double.maxFinite,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          duration.inHours.toString().padLeft(2, "0"),
                          style: TextStyle(
                            fontSize: 75,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Hours",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          duration.inMinutes
                              .remainder(60)
                              .toString()
                              .padLeft(2, "0"),
                          style: TextStyle(
                            fontSize: 75,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Minutes",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          duration.inSeconds
                              .remainder(60)
                              .toString()
                              .padLeft(2, "0"),
                          style: TextStyle(
                            fontSize: 75,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Seconds",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            isRunning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red[500]),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () {
                          setState(() {
                            if (repeated!.isActive) {
                              repeated!.cancel();
                            } else {
                              startTimer();
                            }
                          });
                        },
                        child: Text(
                          (repeated!.isActive) ? "Stop" : "Resume",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red[500]),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () {
                          repeated!.cancel();
                          setState(() {
                            duration = Duration(seconds: 0);
                            isRunning = false;
                          });
                        },
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {
                      startTimer();
                      setState(() {
                        isRunning = true;
                      });
                    },
                    child: Text(
                      "Start Timer", 
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
