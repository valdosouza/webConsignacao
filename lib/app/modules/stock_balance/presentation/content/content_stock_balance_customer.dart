import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:flutter/material.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/customer_all_by_products.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentStockBalanceCustomer extends StatefulWidget {
  final StockBalanceModel stockBalance;
  const ContentStockBalanceCustomer({
    super.key,
    required this.stockBalance,
  });

  @override
  State<ContentStockBalanceCustomer> createState() =>
      ContentStockBalanceCustomerState();
}

class ContentStockBalanceCustomerState
    extends State<ContentStockBalanceCustomer> {
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
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              search(bloc),
              body(),
            ],
          )),
    );
  }

  Container search(StockBalanceBloc bloc) {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        onChanged: (value) {
          bloc.add(StockBalanceCustomerSearchEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquisar balanço de estoque por nome do produto",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Expanded body() {
    return Expanded(
      child: widget.stockBalance.items.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum registro em nossa base."))
          : ListView.separated(
              itemCount: widget.stockBalance.items.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: (Colors.black),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(
                      (index + 1).toString(),
                      style: kCircleAvatarTextStyle,
                    ),
                  ),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.stockBalance.items[index].nameMerchandise),
                    const SizedBox(height: 5.0),
                    Text(widget.stockBalance.items[index].quantity.toString())
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  onPressed: () {
                    bloc.add(GetStockBalanceAllCutomerByProductEvent(
                        params: ParamsGetCustomerAllByProducts(
                            tbProductId: widget
                                .stockBalance.items[index].tbMerchandiseId)));
                  },
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
