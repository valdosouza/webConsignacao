import 'package:appweb/app/core/shared/widgets/custom_search_filter.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/stock_balance/data/model/stock_balance_by_product_model.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';

class ContentStockBalanceCustomerDetailed extends StatefulWidget {
  final StockBalanceByProductModel model;
  const ContentStockBalanceCustomerDetailed({
    super.key,
    required this.model,
  });

  @override
  State<ContentStockBalanceCustomerDetailed> createState() =>
      ContentStockBalanceCustomerDetailedState();
}

class ContentStockBalanceCustomerDetailedState
    extends State<ContentStockBalanceCustomerDetailed> {
  late final StockBalanceBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockBalanceModule>();
    });
    bloc = Modular.get<StockBalanceBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: AutoSizeText(
          "Produto: ${widget.model.nameProduct}",
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            bloc.add(StockBalanceReturnStockListPagEvent());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  search(),
                  title(),
                  body(size),
                ],
              )),
        ),
      ),
    );
  }

  search() {
    return Column(
      children: [
        CustomSearchFilter(
          title: "Filtre aqui por cliente",
          readOnly: false,
          initialValue: bloc.nameCustomer,
          suffixIcon: const Icon(
            Icons.search,
            size: 20.0,
            color: Colors.white,
          ),
          onAction: null,
          onChange: ((value) => {
                bloc.nameCustomer = value,
                bloc.add(FilterCustomerEvent()),
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: bloc.balanceDivergent,
              onChanged: (bool? value) {
                setState(() {
                  bloc.balanceDivergent = value!;
                  bloc.add(FilterBalanceDivergentEvent());
                });
              },
            ),
            const Text("Mostrar somente saldo divergente"),
          ],
        ),
      ],
    );
  }

  title() {
    return const SizedBox(
      height: 25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: AutoSizeText(
              "Nome do Cliente",
              maxFontSize: 18,
              minFontSize: 12,
              style: kLabelStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Saldo",
              textAlign: TextAlign.right,
              style: kLabelStyle,
            ),
          )
        ],
      ),
    );
  }

  body(Size size) {
    return widget.model.items.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : SizedBox(
            height: size.height - 201,
            width: size.width,
            child: ListView.separated(
              itemCount: widget.model.items.length,
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: AutoSizeText(
                      widget.model.items[index].nameCustomer,
                      maxFontSize: 18,
                      minFontSize: 12,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.model.items[index].quantity.toString(),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
          );
  }
}
