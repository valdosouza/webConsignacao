import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollaboratorIdentificationPersonWidget extends StatefulWidget {
  final CollaboratorBloc bloc;
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
                initialValue: widget.bloc.entity.name,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateRequired(value),
                onChanged: (value) {
                  widget.bloc.entity.entity!.nameCompany = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'CPF',
                initialValue: widget.bloc.entity.name,
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
                title: 'Estado emissor do RG',
                initialValue: widget.bloc.entity.person!.rgStateIssuer,
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.person!.rgStateIssuer = value;
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
                  widget.bloc.entity.entity!.aniversary = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Data de Admissão',
                initialValue: widget.bloc.entity.dtAdmission,
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.datetime,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.dtAdmission = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Data de Demissão',
                initialValue: widget.bloc.entity.dtResignation,
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.datetime,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.dtResignation = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Cargo',
                initialValue: widget.bloc.entity.entity!.nameLineBussiness,
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                sufixIcon: IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    widget.bloc.add(CollaboratorGetLineBusinessEvent(widget.bloc.entity.institution!));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
                validator: (value) => Validators.validateRequired(value),
                onChanged: (value) {
                  widget.bloc.entity.entity!.nameLineBussiness = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
