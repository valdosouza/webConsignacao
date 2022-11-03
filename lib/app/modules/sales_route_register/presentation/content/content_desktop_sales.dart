import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_bloc.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/sales_states.dart';
import '../pages/sales_interaction_page.dart';

class ContentDesktopSales extends StatefulWidget {
  const ContentDesktopSales({super.key});

  @override
  State<ContentDesktopSales> createState() =>
      _ContentDesktoLineBusinesseState();
}

class _ContentDesktoLineBusinesseState extends State<ContentDesktopSales> {
  late SalesBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<SalesBloc>();
    // bloc.add(LoadSalesEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesBloc, SalesState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SalesAddSuccessSate) {
          CustomToast.showToast("Rota adicionada com sucesso");
          // bloc.add(LoadSalesEvent());
        } else if (state is SalesAddErrorSate) {
          CustomToast.showToast(
              "Erro ao adicionar uma rota. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is SalesInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SalesInterationPageState) {
          return SalesInteractionPage(
            bloc: bloc,
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Formas de Pagamento'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(SalesInteractionEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
