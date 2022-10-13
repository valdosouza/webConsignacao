import 'package:appweb/app/modules/home/presentation/home_cubit/home_cubit.dart';
import 'package:appweb/app/modules/home/presentation/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentMobileAdmin extends StatefulWidget {
  const ContentMobileAdmin({super.key});

  @override
  State<ContentMobileAdmin> createState() => _ContentMobileAdminState();
}

class _ContentMobileAdminState extends State<ContentMobileAdmin> {
  late DateTime initialDate = DateTime.now();
  late DateTime finalDate = DateTime.now();
  String selectedTerminal = 'Todos';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<HomeCubit>()
        ..getFinancialClosed('2020-04-01', '2020-04-01', selectedTerminal),
      child: SingleChildScrollView(
        child: _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sending Message"),
          ));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadedState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Container()],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
