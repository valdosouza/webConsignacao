import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollaboratorIdentificationCompanyWidget extends StatefulWidget {
  final CollaboratorBloc bloc;
  final GlobalKey formKey;
  const CollaboratorIdentificationCompanyWidget({
    super.key,
    required this.bloc,
    required this.formKey,
  });

  @override
  State<CollaboratorIdentificationCompanyWidget> createState() =>
      _CollaboratorIdentificationCompanyWidgetState();
}

class _CollaboratorIdentificationCompanyWidgetState
    extends State<CollaboratorIdentificationCompanyWidget> {
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
                title: 'Razão Social',
                initialValue: widget.bloc.entity.name,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateRequired(value),
                onChanged: (value) {
                  widget.bloc.entity.company!.cnpj = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'CNPJ',
                initialValue: widget.bloc.entity.company!.cnpj,
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                sufixIcon: IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    if (widget.bloc.entity.company!.cnpj.length == 14) {
                      widget.bloc.add(
                          CollaboratorCnpjEvent(widget.bloc.entity.company!.cnpj));
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
                  widget.bloc.entity.company!.cnpj = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'IE',
                initialValue: widget.bloc.entity.company!.ie,
                validator: (value) => Validators.validateRequired(value),
                keyboardType: TextInputType.datetime,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.company!.ie = value;
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
            ],
          ),
        ),
      ),
    );
  }
}
