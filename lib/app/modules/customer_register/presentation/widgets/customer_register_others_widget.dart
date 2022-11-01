import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:flutter/material.dart';

class CustomerRegisterOthersWidget extends StatefulWidget {
  final CustomerRegisterBloc bloc;
  final CustomerMainModel? customer;
  const CustomerRegisterOthersWidget({
    super.key,
    this.customer,
    required this.bloc,
  });

  @override
  State<CustomerRegisterOthersWidget> createState() =>
      _CustomerRegisterOthersWidgetState();
}

class _CustomerRegisterOthersWidgetState
    extends State<CustomerRegisterOthersWidget> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          const SizedBox(width: 30.0),
          CustomInput(
            title: 'Vendedor',
            initialValue: widget.customer?.phone.number,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              widget.customer?.phone.number = value;
            },
          ),
        ],
      ),
    );
  }
}
