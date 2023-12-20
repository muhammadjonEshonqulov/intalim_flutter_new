import 'package:flutter/material.dart';

import '../../../app/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    init();
    super.initState();
  }

  late AnimationController _animatedController;
  late CurvedAnimation _curvedAnimation;

  // var isPinEnabled = false;

  init() {
    _animatedController = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Navigator.of(context).pushReplacementNamed(Routes.login);
          router.go(Routes.login);
        }
      });
    _curvedAnimation = CurvedAnimation(parent: _animatedController, curve: Curves.elasticOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(width: 200, height: 50, child: Image.asset("assets/images/logo_blue.png")),
      ),
    );
  }
}
