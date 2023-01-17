import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:flutter/material.dart';

class CollaboratorRegisterAddressWidget extends StatefulWidget {
  final CollaboratorRegisterBloc bloc;
  final CollaboratorMainModel? collaborator;
  const CollaboratorRegisterAddressWidget({
    super.key,
    this.collaborator,
    required this.bloc,
  });

  @override
  State<CollaboratorRegisterAddressWidget> createState() =>
      _CollaboratorRegisterAddressWidgetState();
}

class _CollaboratorRegisterAddressWidgetState
    extends State<CollaboratorRegisterAddressWidget> {
  var stateId = "";
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
                  if (widget.bloc.collaborator.address.zipCode.length == 8) {
                    widget.bloc.add(CollaboratorRegisterCepEvent(
                        widget.bloc.collaborator.address.zipCode));
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
              initialValue: widget.collaborator?.address.zipCode,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              validator: (value) => Validators.validateExactLength(value, 8),
              onChanged: (value) {
                widget.collaborator?.address.zipCode = value;
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
                              widget.bloc.collaborator.address.stateName,
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
                              widget.bloc
                                  .add(CollaboratorRegisterGetStatesEvent());
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
                              widget.bloc.collaborator.address.cityName,
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
                              widget.bloc.add(CollaboratorRegisterGetCitysEvent(
                                  widget.bloc.collaborator.address.tbStateId));
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
              initialValue: widget.collaborator?.address.street,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                widget.collaborator?.address.street = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Número',
              initialValue: widget.collaborator?.address.nmbr,
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                widget.collaborator?.address.nmbr = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Complemento',
              initialValue: widget.collaborator?.address.complement,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                widget.collaborator?.address.complement = value;
              },
            ),
            const SizedBox(height: 30.0),
            CustomInput(
              title: 'Bairro',
              initialValue: widget.collaborator?.address.neighborhood,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.done,
              onChanged: (value) {
                widget.collaborator?.address.neighborhood = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
