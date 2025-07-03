import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/cashier_closure_event.dart';
import '../bloc/cashier_closure_state.dart';

class ContentCashierClosure extends StatefulWidget {
  final String dateSelected;
  const ContentCashierClosure({
    super.key,
    required this.dateSelected,
  });

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
    final Size size = MediaQuery.of(context).size;
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
            return const CustomCircularProgressIndicator();
          }
          return _listOfCashierClosure(size);
        });
  }

  Container _listOfCashierClosure(Size size) {
    var list = bloc.closureModel.items;
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      height: size.height,
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            if (list[index].kind != "summarized") {
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      list[index].description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: getColor(list[index].color),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      floatToStrF(list[index].tagValue),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(list[index].color),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Divider(height: 30);
            }
          }),
    );
  }
}
