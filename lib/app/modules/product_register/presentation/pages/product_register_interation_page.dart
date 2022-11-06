import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_bloc.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductRegisterInterationPage extends StatefulWidget {
  final ProductRegisterModel? product;
  final int index;
  const ProductRegisterInterationPage(
      {super.key, this.product, required this.index});

  @override
  State<ProductRegisterInterationPage> createState() =>
      _ProductRegisterInterationPageState();
}

class _ProductRegisterInterationPageState
    extends State<ProductRegisterInterationPage> {
  late final ProductRegisterBloc bloc;
  ProductRegisterModel? product;
  final _formKey = GlobalKey<FormState>();

  bool selectRadio = false;

  String description = "";
  String active = "S";

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<ProductRegisterBloc>();
    product = widget.product;
    if (product != null) {
      selectRadio = product!.active == "S";
    }
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
              : Text('Editar ${product!.description}'),
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
                        : bloc.add(ProductRegisterPutEvent(
                            model: ProductRegisterModel(
                            id: widget.index + 1,
                            tbInstitutionId: 1,
                            description: description,
                            active: active,
                          )));
                  }
                },
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  product?.active = "S";
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
                                    product?.active = "N";
                                    active = "N";
                                  }
                                : (value) {}),
                        const SizedBox(width: 5.0),
                        const Text("Não", style: kLabelStyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                CustomInput(
                  title: 'Descrição',
                  initialValue: product?.description ?? "",
                  validator: (value) => Validators.validateRequired(value),
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  onChanged: (value) {
                    product?.description = value;
                    description = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
