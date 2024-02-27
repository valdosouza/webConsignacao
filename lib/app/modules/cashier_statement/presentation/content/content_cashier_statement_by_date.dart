import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentCashierStatementByDay extends StatefulWidget {
  const ContentCashierStatementByDay({super.key});

  @override
  State<ContentCashierStatementByDay> createState() =>
      _ContentCashierStatementState();
}

class _ContentCashierStatementState
    extends State<ContentCashierStatementByDay> {
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
          return SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(children: [
                _buildSearchInput(),
                _listOfCashierClosure(size),
              ]),
            ),
          );
        });
  }

  _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              initialValue: bloc.dateSelected,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  bloc.dateSelected = value;
                } else {
                  bloc.dateSelected = CustomDate.newDate();
                }
              },
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: "Pesquise por dia",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(
                  CashierStatementGetByDayMobileEvent(
                    params: CashierStatementParams(date: bloc.dateSelected),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                //size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _listOfCashierClosure(Size size) {
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
