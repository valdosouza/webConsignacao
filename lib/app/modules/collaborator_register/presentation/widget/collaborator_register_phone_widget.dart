import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorRegisterPhoneWidget extends StatefulWidget {
  const CollaboratorRegisterPhoneWidget({super.key});

  @override
  State<CollaboratorRegisterPhoneWidget> createState() =>
      _CollaboratorRegisterPhoneWidgetState();
}

class _CollaboratorRegisterPhoneWidgetState
    extends State<CollaboratorRegisterPhoneWidget> {
  late final CollaboratorRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CollaboratorRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: 'Telefone',
            initialValue: bloc.model.phone?.number,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.model.phone?.number = value;
            },
          ),
        ],
      ),
    );
  }
}
