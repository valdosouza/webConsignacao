import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorRegisterIdentificationWidget extends StatefulWidget {
  final CollaboratorRegisterBloc bloc;
  final CollaboratorMainModel? collaborator;
  const CollaboratorRegisterIdentificationWidget({
    super.key,
    this.collaborator,
    required this.bloc,
  });

  @override
  State<CollaboratorRegisterIdentificationWidget> createState() =>
      _CollaboratorRegisterIdentificationWidgetState();
}

class _CollaboratorRegisterIdentificationWidgetState
    extends State<CollaboratorRegisterIdentificationWidget> {
  bool selectPersonType = false;
  bool selectWallet = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CollaboratorRegisterModule>();
    });

    selectPersonType = widget.collaborator?.company?.cnpj.isNotEmpty == true;
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
        ],
      ),
    );
  }

  Column _buildJuridicalPerson() {
    return Column(
      children: [
        CustomInput(
          title: 'CNPJ',
          initialValue: widget.collaborator?.company?.cnpj,
          keyboardType: TextInputType.number,
          inputAction: TextInputAction.next,
          sufixIcon: IconButton(
            hoverColor: Colors.transparent,
            onPressed: () {
              if (widget.collaborator?.company?.cnpj.length == 14) {
                widget.bloc.add(CollaboratorRegisterCnpjEvent(
                    widget.collaborator!.company!.cnpj));
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
            widget.collaborator?.company?.cnpj = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Nome/Razão Social',
          initialValue: widget.collaborator?.entity.nameCompany,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.collaborator?.entity.nameCompany = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Nome Fantasia',
          initialValue: widget.collaborator?.entity.nickTrade,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.collaborator?.entity.nickTrade = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Inscrição Estadual',
          initialValue: widget.collaborator?.company?.ie,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.done,
          onChanged: (value) {
            widget.collaborator?.company?.ie = value;
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
          initialValue: widget.collaborator?.person?.cpf,
          keyboardType: TextInputType.number,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.collaborator?.person?.cpf = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Nome',
          initialValue: widget.collaborator?.entity.nameCompany,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.collaborator?.entity.nameCompany = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'Apelido',
          initialValue: widget.collaborator?.entity.nickTrade,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.collaborator?.entity.nickTrade = value;
          },
        ),
        const SizedBox(height: 30.0),
        CustomInput(
          title: 'R.G',
          initialValue: widget.collaborator?.person?.rg,
          keyboardType: TextInputType.number,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            widget.collaborator?.person?.rg = value;
          },
        ),
      ],
    );
  }
}
