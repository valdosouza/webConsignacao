import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorRegisterAddressWidget extends StatefulWidget {
  const CollaboratorRegisterAddressWidget({
    super.key,
  });

  @override
  State<CollaboratorRegisterAddressWidget> createState() =>
      _CollaboratorRegisterAddressWidgetState();
}

class _CollaboratorRegisterAddressWidgetState
    extends State<CollaboratorRegisterAddressWidget> {
  var stateId = "";

  late final CollaboratorRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CollaboratorRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  if (bloc.model.address.zipCode.length == 8) {
                    bloc.add(CollaboratorRegisterCepEvent(
                        bloc.model.address.zipCode));
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
              initialValue: bloc.model.address.zipCode,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              validator: (value) => Validators.validateExactLength(value, 8),
              onChanged: (value) {
                bloc.model.address.zipCode = value;
              },
            ),
            const SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "UF",
                  style: kLabelStyle,
                ),
                const SizedBox(height: 10.0),
                Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              bloc.model.address.stateName,
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
                              bloc.add(CollaboratorRegisterGetStatesEvent());
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
            const SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cidade",
                  style: kLabelStyle,
                ),
                const SizedBox(height: 10.0),
                Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              bloc.model.address.cityName,
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
                              bloc.add(CollaboratorRegisterGetCitysEvent(
                                  bloc.model.address.tbStateId));
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
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Logradouro',
              initialValue: bloc.model.address.street,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.model.address.street = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Número',
              initialValue: bloc.model.address.nmbr,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.model.address.nmbr = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Complemento',
              initialValue: bloc.model.address.complement,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.model.address.complement = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Bairro',
              initialValue: bloc.model.address.neighborhood,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.done,
              onChanged: (value) {
                bloc.model.address.neighborhood = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
