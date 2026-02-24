import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_event.dart';
import 'package:appweb/app/modules/splash/presentation/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  /// Optional bloc for testing; when null, [Modular.get<SplashBloc>] is used.
  final Bloc<SplashEvent, SplashState>? bloc;

  const SplashPage({super.key, this.bloc});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Bloc<SplashEvent, SplashState> bloc;
  @override
  void initState() {
    bloc = widget.bloc ?? Modular.get<SplashBloc>();
    bloc.add(SplashInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<Bloc<SplashEvent, SplashState>, SplashState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is AuthorizedState) {
            Modular.to.navigate('/home/');
          }
          if (state is NotAuthorizedState) {
            Modular.to.navigate('/auth/');
          }
          if (state is LoadingState) {
            const CustomCircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return const CustomCircularProgressIndicator();
        },
      ),
    );
  }
}
