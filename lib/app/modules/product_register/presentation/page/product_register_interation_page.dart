import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/product_register/data/model/product_price_list_model.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_bloc.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductRegisterInterationPage extends StatefulWidget {
  const ProductRegisterInterationPage({super.key});

  @override
  State<ProductRegisterInterationPage> createState() =>
      _ProductRegisterInterationPageState();
}

class _ProductRegisterInterationPageState
    extends State<ProductRegisterInterationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late final ProductRegisterBloc bloc;
  final _formKey = GlobalKey<FormState>();

  List<ProductPriceListModel> priceList = [];

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Dados do Produto'),
    const Tab(text: 'Tabela de Preço'),
  ];

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<ProductRegisterBloc>();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        bloc.add(ProductRegisterGetListEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: bloc.model.product.id == 0
              ? const Text('Adicionar')
              : Text('Editar ${bloc.model.product.description}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: kSecondaryColor),
            onPressed: () {
              bloc.add(ProductRegisterGetListEvent());
            },
          ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.model.product.id > 0
                ? bloc.add(ProductRegisterPutEvent())
                : bloc.add(ProductRegisterPostEvent());
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.save, color: kSecondaryColor),
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
            CustomInput(
              title: 'Descrição',
              initialValue: bloc.model.product.description,
              validator: (value) => Validators.validateRequired(value),
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.model.product.description = value;
              },
            ),
            const SizedBox(height: 30.0),
            const Text("Ativo", style: kLabelStyle),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Row(
                  children: [
                    Radio<OptionYesNo>(
                      value: OptionYesNo.S,
                      groupValue: bloc.optionYesNo,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          bloc.optionYesNo = value;
                        });
                        bloc.model.product.active = "S";
                      },
                    ),
                    const SizedBox(width: 5.0),
                    const Text("Sim", style: kLabelStyle),
                  ],
                ),
                const SizedBox(width: 10.0),
                Row(
                  children: [
                    Radio<OptionYesNo>(
                        value: OptionYesNo.N,
                        groupValue: bloc.optionYesNo,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            bloc.optionYesNo = value;
                          });
                          bloc.model.product.active = "N";
                        }),
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
    if (bloc.model.priceList.isEmpty) {
      return const Center(
        child: Text("Este produto ainda não possui uma tabela de preço"),
      );
    } else {
      return ListView.separated(
        itemCount: bloc.model.priceList.length,
        itemBuilder: (context, index) => CustomInput(
          width: 200,
          title: bloc.model.priceList[index].namePriceList!,
          alignment: Alignment.centerRight,
          textAlign: TextAlign.right,
          initialValue: floatToStrF(bloc.model.priceList[index].priceTag!),
          validator: (value) => Validators.validateRequired(value),
          keyboardType: TextInputType.number,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            if (value.isNotEmpty) {
              bloc.model.priceList[index].priceTag = double.parse(value);
            }
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      );
    }
  }
}
