import 'package:flutter/cupertino.dart';
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..forward();
  late final Animation<double> _animation =
      CurvedAnimation(parent: controller, curve: Curves.easeOut);
  @override
  void initState() {
    super.initState();
    controller;
    AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

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
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: isDarkMode ? darkGradient : lightGradient),
          child: SingleChildScrollView(
            child: isDarkMode ? buildNightMode() : buildDayMode(),
          ),
        ),
      ),
    );
  }

  Widget buildDayMode() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 16),
      child: Stack(
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.height / 2 - 48,
            left: 0,
            right: 0,
            child: Lottie.asset(
              'assets/anim/night.json',
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
              top: 56,
              left: 32,
              child: Lottie.asset('assets/anim/sun.json', height: 148)),
          Positioned(
            top: 120,
            left: 0,
            child: Lottie.asset(
              'assets/anim/cloud.json',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
              top: 16,
              right: 32,
              child: FlutterSwitch(
                onToggle: (bool value) {
                  controller.reset();
                  controller.forward();
                  setState(() {
                    isDarkMode = value;
                  });
                },
                inactiveColor: Colors.white,
                activeColor: Colors.white,
                inactiveToggleColor: const Color(0xffFFD600),
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(48)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            color: Color(0xff292E34),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CupertinoTextField(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xffF0F0F0),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            color: Color(0xff292E34),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CupertinoTextField(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xffF0F0F0),
                          ),
                          suffix: Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Lupa password?',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget buildNightMode() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 16),
      child: Stack(
        children: [
          Positioned(
              bottom: MediaQuery.of(context).size.height / 2 - 48,
              left: 0,
              right: 0,
              child: Lottie.asset(
                'assets/anim/day.json',
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              )),
          Positioned(
            top: 56,
            right: 32,
            child: Lottie.asset('assets/anim/moon.json', height: 148),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Lottie.asset(
              'assets/anim/shooting_star.json',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2 - 180,
            ),
          ),
          Positioned(
              top: 16,
              right: 32,
              child: FlutterSwitch(
                onToggle: (bool value) {
                  controller.reset();
                  controller.forward();
                  setState(() {
                    isDarkMode = value;
                  });
                },
                inactiveColor: Colors.white,
                activeColor: Colors.white,
                inactiveToggleColor: const Color(0xffFFD600),
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
                decoration: const BoxDecoration(
                  color: Color(0xff292E34),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(48)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CupertinoTextField(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xff1E2226),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CupertinoTextField(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xff1E2226),
                          ),
                          suffix: Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Lupa password?',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xff292E34),
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
