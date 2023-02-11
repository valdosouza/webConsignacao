import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:flutter/material.dart';

class CustomerRegisterOthersDesktopWidget extends StatefulWidget {
  final CustomerRegisterBloc bloc;
  final CustomerMainModel? customer;
  const CustomerRegisterOthersDesktopWidget({
    super.key,
    this.customer,
    required this.bloc,
  });

  @override
  State<CustomerRegisterOthersDesktopWidget> createState() =>
      _CustomerRegisterOthersDesktopWidgetState();
}

class _CustomerRegisterOthersDesktopWidgetState
    extends State<CustomerRegisterOthersDesktopWidget> {
  @override
  Widget build(BuildContext context) {
    bool active = (widget.customer?.customer.active == "S");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Ativo", style: kLabelStyle),
          const SizedBox(height: 0.0),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: active,
                    activeColor: Colors.red,
                    onChanged: active
                        ? (value) {}
                        : (value) {
                            setState(() {
                              active = true;
                            });
                            widget.customer?.customer.active = "S";
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
                      groupValue: active,
                      activeColor: Colors.red,
                      onChanged: active
                          ? (value) {
                              setState(() {
                                active = false;
                              });
                              widget.customer?.customer.active = "N";
                            }
                          : (value) {}),
                  const SizedBox(width: 5.0),
                  const Text("Não", style: kLabelStyle),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vendedor",
                style: kLabelStyle,
              ),
              const SizedBox(height: 10.0),
              Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            widget.customer?.customer.salesmanName ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          hoverColor: Colors.transparent,
                          onPressed: () {
                            widget.bloc.add(CustomerRegisterGetSalesmanEvent());
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rota de Venda",
                style: kLabelStyle,
              ),
              const SizedBox(height: 10.0),
              Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            widget.customer?.customer.salesRouteName ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          hoverColor: Colors.transparent,
                          onPressed: () {
                            widget.bloc
                                .add(CustomerRegisterGetSalesRouteEvent());
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
