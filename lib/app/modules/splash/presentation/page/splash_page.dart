import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_event.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashBloc bloc;
  @override
  void initState() {
    bloc = Modular.get<SplashBloc>();
    bloc.add(SplashInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<SplashBloc, SplashState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SplashLoggedState) {
            if (!state.logged) {
              Modular.to.navigate('/auth/');
            } else {
              Modular.to.navigate('/home/');
            }
          }
        },
        builder: (context, state) {
          return const CustomCircularProgressIndicator();
        },
      ),
    );
  }
}
