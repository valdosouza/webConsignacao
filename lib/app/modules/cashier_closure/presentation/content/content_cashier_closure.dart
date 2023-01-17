import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/widget/sticky_header_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentCashierClosure extends StatefulWidget {
  final String dateSelected;
  const ContentCashierClosure({
    Key? key,
    required this.dateSelected,
  }) : super(key: key);

  @override
  State<ContentCashierClosure> createState() => _ContentCashierClosureState();
}

class _ContentCashierClosureState extends State<ContentCashierClosure> {
  late CashierClosureBloc bloc;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierClosureModule>();
    });
    bloc = Modular.get<CashierClosureBloc>();
    bloc.add(CashierClosureGetClosureEvent(date: widget.dateSelected));
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
          return _listOfCashierClosure();
        });
  }

  _listOfCashierClosure() {
    var currenKind = '';
    List<int> listIndex = [];
    List<int> listIndexSum = [];
    List<String> listKind = [];

    for (var i in bloc.closureModel.items!) {
      if (currenKind == '' || currenKind != i.kind) {
        currenKind = i.kind;
        listIndex.add(bloc.closureModel.items!.indexOf(i));
        if (bloc.closureModel.items![bloc.closureModel.items!.indexOf(i)]
                .kind ==
            'sumarized1') {
          listIndexSum.add(bloc.closureModel.items!.indexOf(i));
        }
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
