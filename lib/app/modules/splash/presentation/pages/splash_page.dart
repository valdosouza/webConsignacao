import 'package:appweb/app/app_module.dart';
import 'package:appweb/app/modules/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      await Modular.isModuleReady<AppModule>();
      final pageCubit = Modular.get<SplashCubit>();
      pageCubit.checkLogged();
      pageCubit.stream.listen((state) {
        if (!state.logged) {
          Modular.to.navigate('/auth/');
        } else {
          Modular.to.navigate('/home/');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            Image.asset(
              "images/logomarca.png",
              width: 450,
              height: 196,
              //fit: BoxFit.fill,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
