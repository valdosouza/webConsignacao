import 'package:appweb/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:appweb/app/modules/home/presentation/bloc/home_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ContentMobileHome extends StatefulWidget {
  const ContentMobileHome({super.key});

  @override
  State<ContentMobileHome> createState() => _ContentMobileHomeState();
}

class _ContentMobileHomeState extends State<ContentMobileHome> {
  late final HomeBloc bloc;
  late DateTime initialDate = DateTime.now();
  late DateTime finalDate = DateTime.now();
  String selectedTerminal = 'Todos';

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<HomeBloc>();
    /*
    bloc.add(HomeGetFinancialEvent(
      initialDate: '2020-04-01',
      finalDate: '2020-04-01',
      terminal: selectedTerminal,
    ));
    */
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: SingleChildScrollView(
        child: _build(context),
      ),
    );
  }

  String getFromInititalDate() {
    return DateFormat('dd/MM/yyyy').format(initialDate);
  }

  String getFromFinalDate() {
    return DateFormat('dd/MM/yyyy').format(finalDate);
  }

  Widget _build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is HomeErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Sending Message"),
        ));
      }
    }, builder: (context, state) {
      return Container();
    });
  }
}
