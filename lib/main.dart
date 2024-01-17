import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int resScore = 50;
  int yellowScor = 50;

  void redScoreUpate() {
    setState(
      () {
        resScore = resScore + 1;
        yellowScor = yellowScor - 1;
      },
    );
  }

  void yellowScoreUpate() {
    setState(
      () {
        yellowScor = yellowScor + 1;
        resScore = resScore - 1;
      },
    );
  }

  void restartGame() {
    setState(() {
      yellowScor = 50;
      resScore = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: resScore,
                  child: InkWell(
                    onTap: redScoreUpate,
                    child: Container(
                      color: Color.fromARGB(255, 238, 46, 32),
                    ),
                  ),
                ),
                Expanded(
                  flex: yellowScor,
                  child: InkWell(
                    onTap: yellowScoreUpate,
                    child: Container(
                      color: Color.fromARGB(255, 47, 229, 37),
                    ),
                  ),
                )
              ],
            ),
            resScore >= 100 || yellowScor >= 100
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromARGB(255, 229, 7, 203).withOpacity(0.70),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${resScore >= 100 ? "Red" : "BLUE"} Won!!",
                            style:
                                TextStyle(fontSize: 45.0, color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: restartGame,
                            child: Text("Restart"),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
