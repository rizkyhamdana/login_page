import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;
  LinearGradient lightGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.blue,
      Colors.white,
    ],
  );

  LinearGradient darkGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    colors: [
      Color(0xff5D5E5F),
      Colors.black,
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:
            BoxDecoration(gradient: isDarkMode ? darkGradient : lightGradient),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Stack(
              children: [
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 2 - 48,
                  left: 0,
                  right: 0,
                  child: isDarkMode
                      ? Lottie.asset(
                          'assets/anim/day.json',
                          fit: BoxFit.cover,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                        )
                      : Lottie.asset(
                          'assets/anim/night.json',
                          fit: BoxFit.cover,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                        ),
                ),
                Positioned(
                    top: 56,
                    right: 32,
                    child: isDarkMode
                        ? Lottie.asset('assets/anim/moon.json', height: 148)
                        : Lottie.asset('assets/anim/sun.json', height: 148)),
                isDarkMode
                    ? Container()
                    : Positioned(
                        top: 120,
                        left: 0,
                        child: Lottie.asset(
                          'assets/anim/cloud.json',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                isDarkMode
                    ? Positioned(
                        top: 0,
                        left: 0,
                        child: Lottie.asset(
                          'assets/anim/shooting_star.json',
                          width: MediaQuery.of(context).size.width,
                        ),
                      )
                    : Container(),
                Positioned(
                    top: 16,
                    right: 32,
                    child: FlutterSwitch(
                      onToggle: (bool value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                      inactiveColor: Colors.white,
                      activeColor: Colors.white,
                      inactiveToggleColor: Colors.yellow,
                      inactiveIcon: const Icon(
                        Icons.sunny,
                        color: Colors.white,
                      ),
                      activeIcon: const Icon(
                        Icons.dark_mode_outlined,
                        color: Colors.white,
                      ),
                      toggleColor: Colors.black,
                      value: isDarkMode,
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      padding: EdgeInsets.fromLTRB(
                          32, 32, 32, MediaQuery.of(context).padding.bottom),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode ? const Color(0xff292E34) : Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(48)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text('Username'),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () {}, child: const Text('Login')))
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
