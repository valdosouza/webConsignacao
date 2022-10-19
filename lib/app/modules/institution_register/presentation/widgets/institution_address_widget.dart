import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class InstituitionAddressWidget extends StatelessWidget {
  final InstitutionBloc bloc;
  final GlobalKey formK;
  const InstituitionAddressWidget({
    super.key,
    required this.bloc,
    required this.formK,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formK,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInput(
              title: 'CEP',
              sufixIcon: IconButton(
                hoverColor: Colors.transparent,
                onPressed: () {
                  if (bloc.entity.zipCode.length == 8) {
                    bloc.add(InstitutionCepEvent(bloc.entity.zipCode));
                  } else {
                    CustomToast.showToast("CEP inválido.");
                  }
                },
                icon: const Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
              initialValue: bloc.entity.zipCode,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              validator: (value) => Validators.validateExactLength(value, 8),
              onChanged: (value) {
                bloc.entity.zipCode = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'UF',
              initialValue: bloc.entity.region,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.entity.region = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Cidade',
              initialValue: bloc.entity.latitude,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.entity.latitude = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Logradouro',
              initialValue: bloc.entity.street,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.entity.street = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Número',
              initialValue: bloc.entity.nmbr,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.entity.nmbr = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Complemento',
              initialValue: bloc.entity.complement,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.entity.complement = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Bairro',
              initialValue: bloc.entity.neighborhood,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.done,
              onChanged: (value) {
                bloc.entity.neighborhood = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
