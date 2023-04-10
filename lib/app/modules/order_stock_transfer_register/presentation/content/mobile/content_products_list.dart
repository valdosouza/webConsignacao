import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/params_get_list_product_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';

class ContentProductList extends StatefulWidget {
  const ContentProductList({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentProductList> createState() => ContentProductListState();
}

class ContentProductListState extends State<ContentProductList> {
  late final OrderStockTransferRegisterBloc bloc;
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
    bloc = Modular.get<OrderStockTransferRegisterBloc>();
    if (bloc.products.isEmpty) {
      bloc.add(
        ProductsGetEvent(
          ParamsGetlistProductModel(
            tbInstitutionId: 0,
            page: 0,
            id: 0,
            nameProduct: "",
          ),
        ),
      );
    }
  }

  infiniteScrolling() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      bloc.add(ProductsGetEvent(ParamsGetlistProductModel(
        tbInstitutionId: 0,
        page: bloc.pageProducts,
        id: 0,
        nameProduct: bloc.search,
      )));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStockTransferRegisterBloc,
        OrderStockTransferRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: Text('Lista de produtos - ${bloc.products.length}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                bloc.tabIndex = 1;
                bloc.add(OrderReturnMainEvent());
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildSearchInput(),
                const SizedBox(height: 5.0),
                buildListView(),
              ],
            ),
          ),
        );
      },
    );
  }

  buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              initialValue: bloc.search,
              onChanged: (value) {
                bloc.search = value;
                bloc.add(ProductsSearchEvent());
              },
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: "Pesquise aqui",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(ProductsGetEvent(ParamsGetlistProductModel(
                  tbInstitutionId: 0, //será alterado no envio
                  page: 0,
                  id: 0,
                  nameProduct: bloc.search,
                )));
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

  Future<bool?> showEditQuantiryDialog(ProductListModel model) {
    double quantity = 0;
    int index = bloc.orderMain.items
        .indexWhere((element) => element.tbProductId == model.id);
    if (index >= 0) {
      quantity = bloc.orderMain.items[index].quantity;
    }
    return showDialog(
        context: context,
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return AlertDialog(
            title: const Text("Insere Item"),
            content: SizedBox(
              height: height - 530,
              width: width,
              child: Column(
                children: [
                  CustomInput(
                    title: 'Descrição do Produto',
                    readOnly: true,
                    initialValue: model.description,
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.done,
                    alignment: Alignment.center,
                    onChanged: (value) {},
                  ),
                  CustomInput(
                    title: 'Quantidade',
                    initialValue:
                        (quantity > 0) ? quantity.toStringAsFixed(0) : "",
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.done,
                    onChanged: (value) {
                      quantity = 0;
                      if (value != "") quantity = double.parse(value);
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Cancelar"),
              ),
              OutlinedButton(
                onPressed: () {
                  if (quantity == 0) {
                    CustomToast.showToast("Informe uma quantidade válida.");
                  } else {
                    if (index == -1) {
                      bloc.orderMain.items
                          .add(OrderStockTransferRegisterItemsModel(
                        id: 0,
                        tbProductId: model.id,
                        nameProduct: model.description,
                        quantity: quantity,
                        updateStatus: "I",
                      ));
                      index = bloc.orderMain.items.length - 1;
                    } else {
                      bloc.orderMain.items[index].quantity = quantity;
                    }
                    Navigator.pop(context, false);
                  }
                },
                child: const Text("Confirmar"),
              ),
            ],
          );
        });
  }

  buildListView() {
    return Expanded(
      child: bloc.products.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum registro em nossa base."))
          : ListView.separated(
              controller: _scrollController,
              key: const PageStorageKey<String>('page'),
              itemCount: bloc.products.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  bloc.orderItem.tbProductId = bloc.products[index].id;
                  bloc.orderItem.nameProduct = bloc.products[index].description;
                  bloc.add(ProductChosenEvent());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: (Colors.black),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: AutoSizeText(
                        bloc.products[index].id.toString(),
                        maxLines: 1,
                        style: kLabelAvatarStyle,
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bloc.products[index].description),
                    ],
                  ),
                  onLongPress: () {
                    showEditQuantiryDialog(bloc.products[index]);
                  },
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
