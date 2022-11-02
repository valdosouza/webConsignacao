import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_bloc.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PriceListRegisterInterationPage extends StatefulWidget {
  final PriceListRegisterModel? price;
  final int index;
  const PriceListRegisterInterationPage(
      {super.key, this.price, required this.index});

  @override
  State<PriceListRegisterInterationPage> createState() =>
      _PriceListRegisterInterationPageState();
}

class _PriceListRegisterInterationPageState
    extends State<PriceListRegisterInterationPage> {
  late final PriceListRegisterBloc bloc;
  PriceListRegisterModel? price;

  bool selectRadio = false;

  String description = "";
  String active = "N";

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<PriceListRegisterBloc>();
    price = widget.price;
    if (price != null) {
      selectRadio = price!.active == "S";
      active = price!.active;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(PriceListRegisterGetListEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: price == null
              ? const Text('Adicionar')
              : Text('Editar ${price!.description}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              bloc.add(PriceListRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  price != null
                      ? bloc.add(PriceListRegisterEditEvent(model: price!))
                      : bloc.add(PriceListRegisterAddEvent(
                          price: PriceListRegisterModel(
                          id: widget.index + 1,
                          tbInstitutionId: 1,
                          description: description,
                          active: active,
                        )));
                },
              ),
            ),
          ],
        ),
        body: Padding(
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
                                price?.active = "S";
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
                                  price?.active = "N";
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
                initialValue: price?.description ?? "",
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  price?.description = value;
                  description = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
