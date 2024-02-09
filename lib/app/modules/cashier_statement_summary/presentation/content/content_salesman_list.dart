import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';

class ContentSalesmanList extends StatefulWidget {
  final List<SalesmanModel> list;
  const ContentSalesmanList({
    super.key,
    required this.list,
  });

  @override
  State<ContentSalesmanList> createState() => _ContentSalesmanListState();
}

class _ContentSalesmanListState extends State<ContentSalesmanList> {
  late CashierStatementSummaryBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierStatementSummaryBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTittleSalesmanList(),
        const SizedBox(height: 10),
        buildContentSalesmanList(),
      ],
    );
  }

  buildTittleSalesmanList() {
    return Container(
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Text("Vendedor",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ],
        ),
      ),
    );
  }

  buildContentSalesmanList() {
    return Expanded(
      child: ListView.separated(
        itemCount: bloc.salesmanList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: ListTile(
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
              children: [
                Expanded(
                  flex: 1,
                  child: Text(bloc.salesmanList[index].nickTrade),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                bloc.tbSalesmanId = bloc.salesmanList[index].id;
                bloc.nameSalesman = bloc.salesmanList[index].nickTrade;
                bloc.add(MainFormEvent());
              },
            ),
          ),
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
