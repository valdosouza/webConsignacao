import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentCashierStatement extends StatefulWidget {
  const ContentCashierStatement({super.key});

  @override
  State<ContentCashierStatement> createState() =>
      _ContentCashierStatementState();
}

class _ContentCashierStatementState extends State<ContentCashierStatement> {
  late CashierStatementBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierStatementBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<CashierStatementBloc, CashierStatementState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ErrorState) {
            CustomToast.showToast(state.msg);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const CustomCircularProgressIndicator();
          }
          if (bloc.cashierStatement.isEmpty) {
            return const Center(
                child: Text("Não encontramos nenhum registro em nossa base."));
          }
          return _listOfCashierClosure(size);
        });
  }

  Container _listOfCashierClosure(Size size) {
    var list = bloc.cashierStatement;
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
