import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/params_get_list_product_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/state.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/mobile/content_tab_detail.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/content/mobile/content_tab_master.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class ContentOrderMain extends StatefulWidget {
  final int tabIndex;
  const ContentOrderMain({Key? key, this.tabIndex = 0}) : super(key: key);

  @override
  State<ContentOrderMain> createState() => _ContentOrderMainState();
}

class _ContentOrderMainState extends State<ContentOrderMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late final OrderStockTransferRegisterBloc bloc;
  late MaskedTextController controllerDate;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockTransferRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockTransferRegisterModule>();
    });
    //Vai sinalizar na busca para começar da pagina 0
    bloc.pageProducts = -1;

    _tabController = TabController(vsync: this, length: 2);
    _tabController.animateTo(widget.tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(OrderGetListEvent());
        return true;
      },
      child: BlocConsumer<OrderStockTransferRegisterBloc,
          OrderStockTransferRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is StocksLoadErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
          if (state is ProductGetErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(OrderGetListEvent());
                },
              ),
              title: Text(
                bloc.orderMain.order.id > 0 ? "Editar " : "Adicionar",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorWeight: 2.0,
                indicatorColor: Colors.black,
                tabs: [
                  const Tab(text: 'Dados'),
                  Tab(
                    child: ListTile(
                      title: const Center(
                          child: Text(
                        'Itens',
                        style: TextStyle(color: Colors.white),
                      )),
                      trailing: IconButton(
                        onPressed: () {
                          if (bloc.orderMain.order.status != "F") {
                            bloc.add(ProductsGetEvent(ParamsGetlistProductModel(
                              tbInstitutionId: 0,
                              page: 0,
                              id: 0,
                              nameProduct: "",
                            )));
                          }
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                ContentTabMaster(),
                ContentTabDetail(),
              ],
            ),
            floatingActionButton: (bloc.orderMain.order.status != "F")
                ? FloatingActionButton(
                    onPressed: () async {
                      if (bloc.orderMain.order.id > 0) {
                        bloc.add(OrderPutEvent());
                      } else {
                        bloc.orderMain.order.tbEntityId = int.parse(
                            await LocalStorageService.instance
                                .get(key: LocalStorageKey.tbUserId));
                        bloc.orderMain.order.tbStockListIdOri = 0;
                        bloc.orderMain.order.tbStockListIdDes = 0;
                        bloc.add(OrderPostEvent());
                      }
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.save),
                  )
                : null,
          );
        },
      ),
    );
  }
}
