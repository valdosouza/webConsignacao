import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/sales_average/data/model/sales_average_model.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/sales_average/sales_average_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class SalesAverageContent extends StatefulWidget {
  final List<SalesAverageModel> list;
  const SalesAverageContent({
    super.key,
    required this.list,
  });

  @override
  State<SalesAverageContent> createState() => _SalesAverageContentState();
}

class _SalesAverageContentState extends State<SalesAverageContent> {
  late SalesAverageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<SalesAverageBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<SalesAverageModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: [
          title(),
          body(size),
          totalizar(),
        ],
      ),
    );
  }

  title() {
    return Container(
      height: 50,
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Cliente",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Total de Vendas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Número de Vendas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Valor Médio",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  body(Size size) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
        alignment: Alignment.topCenter,
        height: size.height - 393,
        child: ListView.separated(
          itemCount: widget.list.length,
          itemBuilder: (_, index) {
            return InkWell(
              splashColor: Colors.red.withOpacity(0.8),
              hoverColor: kPrimaryColor,
              onTap: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(widget.list[index].nameCustomer),
                  ),
                  const SizedBox(height: 1),
                  Expanded(
                    flex: 1,
                    child: Text(
                      floatToStrF(widget.list[index].totalValue),
                      textAlign: TextAlign.right,
                      style: const TextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.list[index].numberOfSales.toStringAsFixed(0),
                      textAlign: TextAlign.right,
                      style: const TextStyle(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      floatToStrF(widget.list[index].tagValue),
                      textAlign: TextAlign.right,
                      style: const TextStyle(),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }

  totalizar() {
    double total = 0;
    for (var element in widget.list) {
      total += element.totalValue;
    }
    double media = 0;
    if (total > 0) {
      media = total / widget.list.length;
    }

    return SizedBox(
      height: 150,
      child: Column(children: [
        Container(
          color: kPrimaryColor,
          child: const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Totalizador",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CustomInput(
                  readOnly: true,
                  initialValue: floatToStrF(total),
                  title: "Valor Total",
                  keyboardType: TextInputType.text,
                  onChanged: null,
                  inputAction: TextInputAction.none,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CustomInput(
                  readOnly: true,
                  initialValue: widget.list.length.toString(),
                  title: "Número de Clientes",
                  keyboardType: TextInputType.text,
                  onChanged: null,
                  inputAction: TextInputAction.none,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CustomInput(
                  readOnly: true,
                  initialValue: floatToStrF(media),
                  title: "Ticket médio",
                  keyboardType: TextInputType.text,
                  onChanged: null,
                  inputAction: TextInputAction.none,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
