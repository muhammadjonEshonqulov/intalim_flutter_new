import 'package:flutter/material.dart';
import 'package:intalim/common/services/utils/utils.dart';
import 'package:intalim/db/cache.dart';

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
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // Navigator.of(context).pushReplacementNamed(Routes.login);
          var token = await cache.getString(cache.token);
          kprint("token--> $token");
          await cache.clear();
          if (token == null) {
            router.go(Routes.login);
          } else {
            router.go(Routes.main);
          }
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
