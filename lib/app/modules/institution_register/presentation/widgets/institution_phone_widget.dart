import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:flutter/material.dart';

class InstituitionPhoneWidget extends StatelessWidget {
  final InstitutionBloc bloc;
  const InstituitionPhoneWidget({
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
            initialValue: bloc.institution.phoneNumber,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.institution.phoneNumber = value;
            },
          ),
        ],
      ),
    );
  }
}
