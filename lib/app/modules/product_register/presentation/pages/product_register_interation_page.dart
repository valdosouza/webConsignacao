import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/product_register/data/model/product_price_list_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_bloc.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductRegisterInterationPage extends StatefulWidget {
  final ProductRegisterMainModel? product;
  final int index;
  const ProductRegisterInterationPage(
      {super.key, this.product, required this.index});

  @override
  State<ProductRegisterInterationPage> createState() =>
      _ProductRegisterInterationPageState();
}

class _ProductRegisterInterationPageState
    extends State<ProductRegisterInterationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late final ProductRegisterBloc bloc;
  ProductRegisterMainModel? product;
  final _formKey = GlobalKey<FormState>();

  bool selectRadio = false;

  List<ProductPriceListModel> priceList = [];

  String description = "";
  String priceTag = "";
  String active = "S";

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Dados do Produto'),
    const Tab(text: 'Tabela de Preço'),
  ];

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<ProductRegisterBloc>();
    product = widget.product;
    if (product != null) {
      selectRadio = product!.product.active == "S";
    }
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(ProductRegisterGetListEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: product == null
              ? const Text('Adicionar')
              : Text('Editar ${product!.product.description}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              bloc.add(ProductRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    product != null
                        ? bloc.add(ProductRegisterPutEvent(model: product!))
                        : bloc.add(
                            ProductRegisterPostEvent(
                              model: ProductRegisterMainModel(
                                product: ProductRegisterModel(
                                  id: widget.index + 1,
                                  tbInstitutionId: 1,
                                  description: description,
                                  active: active,
                                ),
                                priceList: [],
                              ),
                            ),
                          );
                  }
                },
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 2.0,
            indicatorColor: Colors.black,
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _buildMainData(),
            _buildPriceList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainData() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomInput(
            //   title: 'Código',
            //   initialValue: product?.product.id.toString() ?? "0",
            //   validator: (value) => Validators.validateRequired(value),
            //   keyboardType: TextInputType.text,
            //   inputAction: TextInputAction.next,
            //   onChanged: (value) {
            //     product?.product.id = value;
            //     description = value;
            //   },
            // ),
            // const SizedBox(height: 30.0),
            CustomInput(
              title: 'Descrição',
              initialValue: product?.product.description ?? "",
              validator: (value) => Validators.validateRequired(value),
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                product?.product.description = value;
                description = value;
              },
            ),
            const SizedBox(height: 30.0),
            const Text("Ativo", style: kLabelStyle),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: selectRadio,
                      activeColor: Colors.red,
                      onChanged: selectRadio
                          ? (value) {}
                          : (value) {
                              setState(() {
                                selectRadio = true;
                              });
                              product?.product.active = "S";
                              active = "S";
                            },
                    ),
                    const SizedBox(width: 5.0),
                    const Text("Sim", style: kLabelStyle),
                  ],
                ),
                const SizedBox(width: 10.0),
                Row(
                  children: [
                    Radio(
                        value: false,
                        groupValue: selectRadio,
                        activeColor: Colors.red,
                        onChanged: selectRadio
                            ? (value) {
                                setState(() {
                                  selectRadio = false;
                                });
                                product?.product.active = "N";
                                active = "N";
                              }
                            : (value) {}),
                    const SizedBox(width: 5.0),
                    const Text("Não", style: kLabelStyle),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceList() {
    if (product == null) {
      return const Center(
        child: Text("Este produto ainda não possui uma tabela de preço"),
      );
    } else if (product!.priceList.isEmpty) {
      return const Center(
        child: Text("Este produto ainda não possui uma tabela de preço"),
      );
    } else {
      return Column(
        children: List.generate(
          product!.priceList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${product?.priceList[index].namePriceList}'),
                CustomInput(
                  title: '',
                  initialValue:
                      product?.priceList[index].priceTag.toString() ?? "0.0",
                  validator: (value) => Validators.validateRequired(value),
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  onChanged: (value) {
                    product?.priceList[index].priceTag = int.parse(value);
                    priceTag = value;
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
