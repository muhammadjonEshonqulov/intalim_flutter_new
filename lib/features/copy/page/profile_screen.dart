import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';
import 'package:intalim/db/cache.dart';
import 'package:intalim/features/splash/block/me_bloc.dart';
import 'package:intalim/features/splash/model/me_event.dart';

import '../../../app/app.dart';
import '../../../app/router.dart';
import '../block/copy_bloc.dart';
import '../repository/copy_repository.dart';

class CopyPageWithRepo extends StatelessWidget {
  const CopyPageWithRepo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CopyBloc(context.read<CopyRepository>()),
      child: const CopyScreen(),
    );
  }
}

class CopyScreen extends StatefulWidget {
  const CopyScreen({Key? key}) : super(key: key);

  @override
  State<CopyScreen> createState() => _CopyScreenState();
}

class _CopyScreenState extends State<CopyScreen> with TickerProviderStateMixin {
  late MeBloc _meBloc;

  @override
  void initState() {
    _meBloc = BlocProvider.of<MeBloc>(context);
    _meBloc.add(MeEventData());

    init();
    super.initState();
  }

  late AnimationController _animatedController;
  late CurvedAnimation _curvedAnimation;

  // var isPinEnabled = false;

  init() {
    _animatedController = AnimationController(duration: const Duration(seconds: 15), vsync: this)
      ..forward()
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // Navigator.of(context).pushReplacementNamed(Routes.login);
          var token = await cache.getString(cache.token);
          kprint("token--> $token");
          if (token == null) {
            router.go(Routes.login);
          } else {
            router.go(Routes.main);
          }
        }
      });
    _curvedAnimation = CurvedAnimation(parent: _animatedController, curve: Curves.elasticOut);
  }

  // @override
  // void initState() {
  //
  //   // getLocation();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<MeBloc, NetworkResult>(
      listener: (context, state) async {
        if (state is Error) {
          snack(context, state.message.toString());
        } else if (state is Success) {
          // hideLoading();
          var token = await cache.getString(cache.token);
          kprint("token--> $token");
          if (token == null) {
            router.go(Routes.login);
          } else {
            router.go(Routes.main);
          }
        } else if (state is Loading) {
          // showLoading(context);
        } else {
          // hideLoading();
          snack(context, state.message.toString());
        }
      },
      builder: (context, state) {
        return Center(
          child: Container(width: 200, height: 50, child: Image.asset("assets/images/logo_blue.png")),
        );
      },
    ));
  }
}
