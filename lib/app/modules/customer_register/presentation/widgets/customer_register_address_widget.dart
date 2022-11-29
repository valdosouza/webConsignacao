import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:flutter/material.dart';

class CustomerRegisterAddressWidget extends StatefulWidget {
  final CustomerRegisterBloc bloc;
  final CustomerMainModel? customer;
  const CustomerRegisterAddressWidget({
    super.key,
    this.customer,
    required this.bloc,
  });

  @override
  State<CustomerRegisterAddressWidget> createState() =>
      _CustomerRegisterAddressWidgetState();
}

class _CustomerRegisterAddressWidgetState
    extends State<CustomerRegisterAddressWidget> {
  var stateId = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInput(
              title: 'CEP',
              sufixIcon: IconButton(
                hoverColor: Colors.transparent,
                onPressed: () {
                  if (widget.bloc.customer.address.zipCode.length == 8) {
                    widget.bloc.add(CustomerRegisterCepEvent(
                        widget.bloc.customer.address.zipCode));
                  } else {
                    CustomToast.showToast("CEP inválido.");
                  }
                },
                icon: const Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
              initialValue: widget.customer?.address.zipCode,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              validator: (value) => Validators.validateExactLength(value, 8),
              onChanged: (value) {
                widget.customer?.address.zipCode = value;
              },
            ),
            const SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "UF",
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
                              widget.bloc.customer.address.stateName,
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
                              widget.bloc.add(CustomerRegisterGetStatesEvent());
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
                  "Cidade",
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
                              widget.bloc.customer.address.cityName,
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
                              widget.bloc.add(CustomerRegisterGetCitysEvent(
                                  widget.bloc.customer.address.tbStateId));
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
            CustomInput(
              title: 'Logradouro',
              initialValue: widget.customer?.address.street,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                widget.customer?.address.street = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Número',
              initialValue: widget.customer?.address.nmbr,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                widget.customer?.address.nmbr = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Complemento',
              initialValue: widget.customer?.address.complement,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                widget.customer?.address.complement = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Bairro',
              initialValue: widget.customer?.address.neighborhood,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.done,
              onChanged: (value) {
                widget.customer?.address.neighborhood = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
