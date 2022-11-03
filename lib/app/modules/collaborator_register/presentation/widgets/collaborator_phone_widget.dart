import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class CollaboratorPhoneWidget extends StatelessWidget {
  final CollaboratorRegisterBloc bloc;
  const CollaboratorPhoneWidget({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = MaskedTextController(
        text: bloc.entity.phone!.number, mask: "(00) 0 0000-0000");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: 'Nome do Contato',
            initialValue: bloc.entity.phone!.contact,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.phone!.contact = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Tipo de Telefone(Celular, residencial)',
            initialValue: bloc.entity.phone!.kind,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.phone!.kind = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Endereço do Telefone',
            initialValue: bloc.entity.phone!.addressKind,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.phone!.addressKind = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Número',
            controller: phoneController,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.phone!.number = value;
            },
          ),
        ],
      ),
    );
  }
}
