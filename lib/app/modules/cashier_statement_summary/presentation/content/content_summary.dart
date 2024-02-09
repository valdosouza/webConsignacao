import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_dropdow_buttom.dart';
import 'package:appweb/app/core/shared/widgets/custom_imput_button.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/state.dart';

class ContentSummary extends StatefulWidget {
  final List<SummaryModel> list;
  const ContentSummary({
    super.key,
    required this.list,
  });

  @override
  State<ContentSummary> createState() => _ContentSummaryState();
}

class _ContentSummaryState extends State<ContentSummary> {
  late CashierStatementSummaryBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierStatementSummaryBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<CashierStatementSummaryBloc,
            CashierStatementSummaryState>(
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
          return Column(children: [
            _search(),
            _header(),
            _body(size),
            _bottom(),
          ]);
        });
  }

  _body(Size size) {
    const double heightCell = 30;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.topCenter,
        height: size.height - 300,
        child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              return InkWell(
                splashColor: Colors.red.withOpacity(0.8),
                hoverColor: kPrimaryColor,
                onTap: () async {},
                child: Row(
                  children: [
                    _fieldCell(
                      "${widget.list[index].day} ${widget.list[index].weekDay}",
                      TextAlign.center,
                      heightCell,
                    ),
                    ...List.generate(widget.list[index].productList.length,
                        (i) {
                      return _fieldCell(
                        widget.list[index].productList[i].value
                            .toStringAsFixed(2),
                        TextAlign.right,
                        heightCell,
                      );
                    }),
                    _fieldCell(
                      widget.list[index].oldDebit.toStringAsFixed(2),
                      TextAlign.right,
                      heightCell,
                    ),
                    _fieldCell(
                      widget.list[index].debitBalance.toStringAsFixed(2),
                      TextAlign.right,
                      heightCell,
                    ),
                    _fieldCell(
                      widget.list[index].totalReceived.toStringAsFixed(2),
                      TextAlign.right,
                      heightCell,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  _header() {
    const double heightCell = 55;
    return Container(
      //padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(left: 5, right: 5),
      alignment: Alignment.topCenter,
      color: Colors.grey[400],

      child: (widget.list.isNotEmpty)
          ? Row(
              children: [
                _fieldCell(
                  "Dia",
                  TextAlign.center,
                  heightCell,
                ),
                ...List.generate(widget.list[0].productList.length, (i) {
                  return _fieldCell(
                    widget.list[0].productList[i].description,
                    TextAlign.center,
                    heightCell,
                  );
                }),
                _fieldCell(
                  "PG DÍVIDA VELHA",
                  TextAlign.center,
                  heightCell,
                ),
                _fieldCell(
                  "FICOU DEVENDO",
                  TextAlign.center,
                  heightCell,
                ),
                _fieldCell(
                  "TOTAL",
                  TextAlign.center,
                  heightCell,
                ),
              ],
            )
          : const Text("Nenhum dado encontrado - Utilize o filtro"),
    );
  }

  _search() {
    return SizedBox(
      //margin: const EdgeInsets.only(left: 10, right: 10),
      //alignment: Alignment.topCenter,
      //color: Colors.grey[400],
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInput(
                title: "Ano",
                initialValue: bloc.year.toString(),
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.go,
                onChanged: (value) {
                  bloc.year = int.parse(value);
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomDropdownButton(
                title: "Mês",
                initialValue: bloc.month,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                list: const <String>[
                  "JANEIRO",
                  "FEVEREIRO",
                  "MARÇO",
                  "ABRIL",
                  "MAIO",
                  "JUNHO",
                  "JULHO",
                  "AGOSTO",
                  "SETEMBRO",
                  "OUTUBRO",
                  "NOVEMBRO",
                  "DEZEMBRO"
                ],
                onChanged: (value) {
                  bloc.month = value;
                },
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInputButton(
                initialValue: bloc.nameSalesman,
                readOnly: true,
                enabled: true,
                title: "Nome do Vendedor",
                onAction: () => bloc.add(GetSalesmanListEvent()),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 3.0, top: 30, right: 10, bottom: 3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(30, 50),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  bloc.add(GetEvent());
                },
                child: const Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Icon(Icons.manage_search_sharp, color: kSecondaryColor),
                    Text(
                      "Atualizar",
                      style: kElevatedButtonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _fieldCell(String text, TextAlign textAlign, double height) {
    return Expanded(
      flex: 1,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black,
        )),
        child: Text(
          text,
          textAlign: textAlign,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  _bottom() {
    const double heightCell = 35;

    double totalOldDebit = 0;
    double totalDebitBalance = 0;
    double totalGeneral = 0;
    if (widget.list.isNotEmpty) {
      for (var item in widget.list) {
        totalOldDebit += item.oldDebit;
        totalDebitBalance += item.debitBalance;
        totalGeneral += item.totalReceived;
      }

      return Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.topCenter,
        color: Colors.grey[400],
        child: Row(
          children: [
            _fieldCell(
              "Total",
              TextAlign.center,
              heightCell,
            ),
            ...List.generate(widget.list[0].productList.length, (i) {
              double total = 0;
              for (var item in widget.list) {
                total += item.productList[i].value;
              }
              return _fieldCell(
                total.toStringAsFixed(2),
                TextAlign.center,
                heightCell,
              );
            }),
            _fieldCell(
              totalOldDebit.toStringAsFixed(2),
              TextAlign.center,
              heightCell,
            ),
            _fieldCell(
              totalDebitBalance.toStringAsFixed(2),
              TextAlign.center,
              heightCell,
            ),
            _fieldCell(
              totalGeneral.toStringAsFixed(2),
              TextAlign.center,
              heightCell,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
