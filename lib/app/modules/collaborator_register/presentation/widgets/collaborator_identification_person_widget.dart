import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:flutter/material.dart';

class CollaboratorIdentificationPersonWidget extends StatefulWidget {
  final CollaboratorRegisterBloc bloc;
  final GlobalKey formKey;
  const CollaboratorIdentificationPersonWidget({
    super.key,
    required this.bloc,
    required this.formKey,
  });

  @override
  State<CollaboratorIdentificationPersonWidget> createState() =>
      _CollaboratorIdentificationPersonWidgetState();
}

class _CollaboratorIdentificationPersonWidgetState
    extends State<CollaboratorIdentificationPersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                title: 'Nome',
                initialValue: widget.bloc.entity.entity!.nameCompany,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateRequired(value),
                onChanged: (value) {
                  widget.bloc.entity.entity!.nameCompany = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Apelido',
                initialValue: widget.bloc.entity.entity!.nickTrade,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateRequired(value),
                onChanged: (value) {
                  widget.bloc.entity.entity!.nickTrade = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'CPF',
                initialValue: widget.bloc.entity.person!.cpf,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateCPF(value!),
                onChanged: (value) {
                  widget.bloc.entity.person!.cpf = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'RG',
                initialValue: widget.bloc.entity.person!.rg,
                keyboardType: TextInputType.datetime,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateRequired(value),
                onChanged: (value) {
                  widget.bloc.entity.person!.rg = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Data de emissão do RG',
                initialValue: widget.bloc.entity.person!.rgDtEmission,
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.datetime,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.person!.rgDtEmission = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Orgão emissor do RG',
                initialValue: widget.bloc.entity.person!.rgOrganIssuer,
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.person!.rgOrganIssuer = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Data de Nascimento',
                initialValue: widget.bloc.entity.person!.birthday,
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.datetime,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.person!.birthday = value;
                },
              ),
              const SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cargo",
                    style: kLabelStyle,
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                widget.bloc.lineBusiness
                                    .firstWhere(
                                        (element) =>
                                            element.id ==
                                            widget
                                                .bloc.entity.entity!.tbLineBussinessId,
                                        orElse: () => LineBusinessModel(
                                            description: "",
                                            active: 's',
                                            id: 0,
                                            institution: 1))
                                    .description,
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
                                widget.bloc.add(
                                    CollaboratorGetLineBusinessEvent(
                                        widget.bloc.entity.institution!));
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
        ),
      ),
    );
  }
}
