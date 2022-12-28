import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/product/presentation/bloc/product_event.dart';
import 'package:appweb/app/modules/product/presentation/bloc/product_bloc.dart';
import 'package:appweb/app/modules/product/presentation/bloc/product_state.dart';
import 'package:appweb/app/modules/product/presentation/widgets/price_list_widget.dart';
import 'package:appweb/app/modules/product/product_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentMobileProduct extends StatefulWidget {
  const ContentMobileProduct({super.key});

  @override
  State<ContentMobileProduct> createState() => _ContentMobileProductState();
}

class _ContentMobileProductState extends State<ContentMobileProduct> {
  late final ProductBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 0)).then((_) async {
      await Modular.isModuleReady<ProductModule>();
    });
    bloc = Modular.get<ProductBloc>();
    bloc.add(ProductPriceListMobileEvent(id: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is ProductPriceListMobileErrorState) {
          CustomToast.showToast(
              "Erro ao buscar a lista. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
                Container(
                decoration: kBoxDecorationStyle,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  onChanged: (value) {
                    bloc.add(ProductSearchPriceListMobileEvent(search: value));
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0),
                    hintText:
                        "Pesquise produto por nome",
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: CustomScrollView(
                  slivers: state.list
                      .map((e) => PriceListWidget(
                          title: e.namePriceList, prices: e.products))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
