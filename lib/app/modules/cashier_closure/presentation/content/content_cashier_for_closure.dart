import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/widget/sticky_header_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/cashier_closure_state.dart';

class ContentCashierForClosure extends StatefulWidget {
  const ContentCashierForClosure({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentCashierForClosure> createState() =>
      _ContentCashierForClosureState();
}

class _ContentCashierForClosureState extends State<ContentCashierForClosure> {
  late CashierClosureBloc bloc;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierClosureModule>();
    });
    bloc = Modular.get<CashierClosureBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CashierClosureBloc, CashierClosureState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CashierClosureGetClosureErrorState) {
            CustomToast.showToast(
                "Não foi possível acessar o fechamento. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          if (state is CashierClosureLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (bloc.closureModel.items!.isEmpty) {
            return const Center(
                child: Text("Não encontramos nenhum registro em nossa base."));
          }
          return _listOfCashierClosure();
        });
  }

  _listOfCashierClosure() {
    var currenKind = '';
    List<int> listIndex = [];
    List<String> listKind = [];

    for (var i in bloc.closureModel.items!) {
      if (currenKind == '' || currenKind != i.kind) {
        currenKind = i.kind;
        listIndex.add(bloc.closureModel.items!.indexOf(i));
      }

      listKind.add(
          bloc.closureModel.items![bloc.closureModel.items!.indexOf(i)].kind);
    }

    return CustomScrollView(
      slivers: listIndex.map(
        (e) {
          return StickyHeaderList(
            listIndex: listIndex,
            index: listIndex.indexOf(e),
            closureModel: bloc.closureModel,
          );
        },
      ).toList(),
    );
  }
}
