import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:flutter/material.dart';

class CustomerRegisterIdentificationWidget extends StatefulWidget {
  final CustomerRegisterBloc bloc;
  final CustomerMainModel? customer;
  const CustomerRegisterIdentificationWidget({
    super.key,
    this.customer,
    required this.bloc,
  });

  @override
  State<CustomerRegisterIdentificationWidget> createState() =>
      _CustomerRegisterIdentificationWidgetState();
}

class _CustomerRegisterIdentificationWidgetState
    extends State<CustomerRegisterIdentificationWidget> {
  bool selectPersonType = false;
  bool selectWallet = false;
  @override
  void initState() {
    super.initState();
    selectPersonType = widget.customer?.company?.cnpj.isNotEmpty == true;
    selectWallet = widget.customer?.customer.consumer == "S";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tipo de Pessoa", style: kLabelStyle),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: selectPersonType,
                    activeColor: Colors.red,
                    onChanged: selectPersonType
                        ? (value) {}
                        : (value) {
                            setState(() {
                              selectPersonType = true;
                            });
                          },
                  ),
                  const SizedBox(width: 5.0),
                  const Text("Jurídica", style: kLabelStyle),
                ],
              ),
              const SizedBox(width: 10.0),
              Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: selectPersonType,
                      activeColor: Colors.red,
                      onChanged: selectPersonType
                          ? (value) {
                              setState(() {
                                selectPersonType = false;
                              });
                            }
                          : (value) {}),
                  const SizedBox(width: 5.0),
                  const Text("Física", style: kLabelStyle),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          selectPersonType ? _buildJuridicalPerson() : _buildPerson(),
          const SizedBox(height: 30.0),
          const Text("Consumidor Final", style: kLabelStyle),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: selectWallet,
                    activeColor: Colors.red,
                    onChanged: selectWallet
                        ? (value) {}
                        : (value) {
                            setState(() {
                              selectWallet = true;
                            });
                            widget.customer?.customer.consumer = "S";
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
                      groupValue: selectWallet,
                      activeColor: Colors.red,
                      onChanged: selectWallet
                          ? (value) {
                              setState(() {
                                selectWallet = false;
                              });
                              widget.customer?.customer.consumer = "N";
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
    );
  }

  Column _buildJuridicalPerson() {
    return Column(
      children: [
        CustomInput(
          title: 'CNPJ',
          initialValue: widget.customer?.company?.cnpj,
          keyboardType: TextInputType.number,
          inputAction: TextInputAction.next,
          sufixIcon: IconButton(
            hoverColor: Colors.transparent,
            onPressed: () {
              if (widget.customer?.company?.cnpj.length == 14) {
                widget.bloc.add(
                    CustomerRegisterCnpjEvent(widget.customer!.company!.cnpj));
              } else {
                CustomToast.showToast("CNPJ inválido.");
              }
            },
            icon: const Icon(
              Icons.search,
              size: 20.0,
              color: Colors.white,
            ),
          ),
          validator: (value) => Validators.validateCNPJ(value),
          onChanged: (value) {
            widget.customer?.company?.cnpj = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Nome/Razão Social',
          initialValue: widget.customer?.entity.nameCompany,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.customer?.entity.nameCompany = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Nome Fantasia',
          initialValue: widget.customer?.entity.nickTrade,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.customer?.entity.nickTrade = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Inscrição Estadual',
          initialValue: widget.customer?.company?.ie,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.done,
          onChanged: (value) {
            widget.customer?.company?.ie = value;
          },
        ),
      ],
    );
  }

  Column _buildPerson() {
    return Column(
      children: [
        CustomInput(
          title: 'CPF',
          initialValue: widget.customer?.person?.cpf,
          keyboardType: TextInputType.number,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.customer?.person?.cpf = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Nome',
          initialValue: widget.customer?.entity.nameCompany,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.customer?.entity.nameCompany = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Apelido',
          initialValue: widget.customer?.entity.nickTrade,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.customer?.entity.nickTrade = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'R.G',
          initialValue: widget.customer?.person?.rg,
          keyboardType: TextInputType.number,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.customer?.person?.rg = value;
          },
        ),
      ],
    );
  }
}
