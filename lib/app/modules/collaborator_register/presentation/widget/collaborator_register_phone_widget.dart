import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:flutter/material.dart';

class CollaboratorRegisterPhoneWidget extends StatelessWidget {
  final CollaboratorRegisterBloc bloc;
  final CollaboratorMainModel? collaborator;
  const CollaboratorRegisterPhoneWidget({
    super.key,
    this.collaborator,
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
            title: 'Telefone',
            initialValue: collaborator?.phone?.number,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              collaborator?.phone?.number = value;
            },
          ),
        ],
      ),
    );
  }
}
