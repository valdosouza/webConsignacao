import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
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
          return SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                _search(),
                _body(size),
              ],
            ),
          );
        });
  }

  Container _header() {
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
                ...List.generate(widget.list[0].productSoldList.length, (i) {
                  return _fieldCell(
                    "Venda ${widget.list[0].productSoldList[i].description}",
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
                _fieldCell(
                  "PONTO C/ VENDAS",
                  TextAlign.center,
                  heightCell,
                ),
                ...List.generate(widget.list[0].productBonusList.length, (i) {
                  return _fieldCell(
                    "Bonifica ${widget.list[0].productBonusList[i].description}",
                    TextAlign.center,
                    heightCell,
                  );
                }),
                ...List.generate(widget.list[0].productLoadList.length, (i) {
                  return _fieldCell(
                    "Baixa ${widget.list[0].productLoadList[i].description}",
                    TextAlign.center,
                    heightCell,
                  );
                }),
                ...List.generate(widget.list[0].productLoadList.length, (i) {
                  return _fieldCell(
                    "Carga Próximo dia ${widget.list[0].productLoadList[i].description}",
                    TextAlign.center,
                    heightCell,
                  );
                }),
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: const Text("Nenhum dado encontrado - Utilize o filtro"),
            ),
    );
  }

  SizedBox _search() {
    return SizedBox(
      height: 81,
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

  Widget _fieldCell(String text, TextAlign textAlign, double height) {
    return Container(
      height: height,
      width: 150,
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
    );
  }

  Row _body(Size size) {
    final ScrollController horizontalScroll = ScrollController();
    final ScrollController verticalScroll = ScrollController();
    const double widthScroll = 15;
    //Numero de Colunas fixas
    int collumsNumber = 5;
    if (widget.list.isNotEmpty) {
      //add colunas de produtos vendidos
      collumsNumber += (widget.list[0].productSoldList.length +
          widget.list[0].productBonusList.length);
      //add colunas de produtos carregados
      collumsNumber += 4;
    }
    final double widthContainer = (collumsNumber * 150) + 10;
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: size.height - (193),
            width: widthContainer, //size.width,
            child: AdaptiveScrollbar(
              controller: verticalScroll,
              width: widthScroll,
              position: ScrollbarPosition.right,
              child: AdaptiveScrollbar(
                controller: horizontalScroll,
                width: widthScroll,
                position: ScrollbarPosition.bottom,
                child: SingleChildScrollView(
                  controller: horizontalScroll,
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: widthContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _header(),
                        _bodyContent(size, widthContainer),
                        _bottom(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SingleChildScrollView _bodyContent(Size size, double widthContainer) {
    const double heightCell = 30;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        height: size.height - 300,
        width: widthContainer, //size.width,
        child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              return InkWell(
                splashColor: Colors.red.withValues(alpha: 0.8),
                hoverColor: kPrimaryColor,
                onTap: () async {},
                child: Row(
                  children: [
                    _fieldCell(
                      "${widget.list[index].day} ${widget.list[index].weekDay}",
                      TextAlign.center,
                      heightCell,
                    ),
                    ...List.generate(widget.list[index].productSoldList.length,
                        (i) {
                      return _fieldCell(
                        floatToStrF(
                            widget.list[index].productSoldList[i].value),
                        TextAlign.right,
                        heightCell,
                      );
                    }),
                    _fieldCell(
                      floatToStrF(widget.list[index].oldDebit),
                      TextAlign.right,
                      heightCell,
                    ),
                    _fieldCell(
                      floatToStrF(widget.list[index].debitBalance),
                      TextAlign.right,
                      heightCell,
                    ),
                    _fieldCell(
                      floatToStrF(widget.list[index].totalReceived),
                      TextAlign.right,
                      heightCell,
                    ),
                    _fieldCell(
                      intToStr(widget.list[index].salesPoints),
                      TextAlign.center,
                      heightCell,
                    ),
                    ...List.generate(widget.list[index].productBonusList.length,
                        (i) {
                      return _fieldCell(
                        intToStr(
                            widget.list[index].productBonusList[i].quantity),
                        TextAlign.center,
                        heightCell,
                      );
                    }),
                    ...List.generate(widget.list[0].productLoadList.length,
                        (i) {
                      return _fieldCell(
                        intToStr(
                            widget.list[index].productLoadList[i].totalAdjust),
                        TextAlign.center,
                        heightCell,
                      );
                    }),
                    ...List.generate(widget.list[0].productLoadList.length,
                        (i) {
                      return _fieldCell(
                        intToStr(
                            widget.list[index].productLoadList[i].totalNewLoad),
                        TextAlign.center,
                        heightCell,
                      );
                    }),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Container _bottom() {
    const double heightCell = 35;

    double totalOldDebit = 0;
    double totalDebitBalance = 0;
    double totalGeneral = 0;
    int totalSalesPoints = 0;
    if (widget.list.isNotEmpty) {
      for (var item in widget.list) {
        totalOldDebit += item.oldDebit;
        totalDebitBalance += item.debitBalance;
        totalGeneral += item.totalReceived;
        totalSalesPoints += item.salesPoints;
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
            ...List.generate(widget.list[0].productSoldList.length, (i) {
              double total = 0;
              for (var item in widget.list) {
                total += item.productSoldList[i].value;
              }
              return _fieldCell(
                floatToStrF(total),
                TextAlign.center,
                heightCell,
              );
            }),
            _fieldCell(
              floatToStrF(totalOldDebit),
              TextAlign.center,
              heightCell,
            ),
            _fieldCell(
              floatToStrF(totalDebitBalance),
              TextAlign.center,
              heightCell,
            ),
            _fieldCell(
              floatToStrF(totalGeneral),
              TextAlign.center,
              heightCell,
            ),
            _fieldCell(
              intToStr(totalSalesPoints),
              TextAlign.center,
              heightCell,
            ),
            ...List.generate(widget.list[0].productBonusList.length, (i) {
              int total = 0;
              for (var item in widget.list) {
                total += item.productBonusList[i].quantity;
              }
              return _fieldCell(
                intToStr(total),
                TextAlign.center,
                heightCell,
              );
            }),
            ...List.generate(widget.list[0].productLoadList.length, (i) {
              int total = 0;
              for (var item in widget.list) {
                total += item.productLoadList[i].totalAdjust;
              }
              return _fieldCell(
                intToStr(total),
                TextAlign.center,
                heightCell,
              );
            }),
            ...List.generate(widget.list[0].productLoadList.length, (i) {
              int total = 0;
              for (var item in widget.list) {
                total += item.productLoadList[i].totalNewLoad;
              }
              return _fieldCell(
                intToStr(total),
                TextAlign.center,
                heightCell,
              );
            }),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
