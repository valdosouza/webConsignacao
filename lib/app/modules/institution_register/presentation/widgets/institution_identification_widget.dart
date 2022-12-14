import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:flutter/material.dart';

class InstituitionIdentificationWidget extends StatelessWidget {
  final InstitutionBloc bloc;
  final GlobalKey formKey;
  const InstituitionIdentificationWidget({
    super.key,
    required this.bloc,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInput(
              title: 'CNPJ',
              initialValue: bloc.institution.cnpj,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              sufixIcon: IconButton(
                hoverColor: Colors.transparent,
                onPressed: () {
                  if (bloc.institution.cnpj.length == 14) {
                    bloc.add(InstitutionCnpjEvent(bloc.institution.cnpj));
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
                bloc.institution.cnpj = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Nome/Razão Social',
              initialValue: bloc.institution.nameCompany,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.institution.nameCompany = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Apelido/Fantasia',
              initialValue: bloc.institution.nickTrade,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.institution.nickTrade = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Inscrição Estadual',
              initialValue: bloc.institution.ie,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.institution.ie = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
