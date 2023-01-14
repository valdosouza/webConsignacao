import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/widgets/cashier_list_previously.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/widgets/consignment_stick_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentMobileCashier extends StatefulWidget {
  const ContentMobileCashier({
    Key? key,
    this.event,
  }) : super(key: key);
  final CashierClosureEvent? event;
  @override
  State<ContentMobileCashier> createState() => _ContentMobileCashierState();
}

class _ContentMobileCashierState extends State<ContentMobileCashier> {
  late CashierClosureBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierClosureBloc>();
    if (widget.event != null) bloc.add(widget.event!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierClosureBloc, CashierClosureState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CashierClosureLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CashierClosureGetClosureLoadedState) {
          return ConsignmentStickHeader(
            closureModel: state.closure,
          );
        }
        if (state is CashierClosureGetClosurePreviouslyLoadedState) {
          return CashierListPreviously(
            bloc: bloc,
            closures: state.closures,
          );
        }
        if (state is CashierClosureGetClosureErrorState) {
          CustomToast.showToast(
              "Erro ao buscar o fechamento. Tente novamente mais tarde.");
        }

        return const Center(child: Text("Sem Dados"));
      },
    );
  }
}
