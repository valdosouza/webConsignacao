import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:flutter/material.dart';

class CollaboratorPhoneWidget extends StatelessWidget {
  final CollaboratorRegisterBloc bloc;
  const CollaboratorPhoneWidget({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: 'Tipo de Telefone(Celular, residencial)',
            initialValue: bloc.entity.phone!.number,
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
