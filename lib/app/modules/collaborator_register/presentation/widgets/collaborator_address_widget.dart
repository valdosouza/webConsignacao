import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/city_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:flutter/material.dart';

class CollaboratorAddressWidget extends StatefulWidget {
  final CollaboratorRegisterBloc bloc;
  final GlobalKey formK;
  const CollaboratorAddressWidget({
    super.key,
    required this.bloc,
    required this.formK,
  });

  @override
  State<CollaboratorAddressWidget> createState() =>
      _CollaboratorAddressWidgetState();
}

class _CollaboratorAddressWidgetState extends State<CollaboratorAddressWidget> {
  var stateId = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formK,
      child: SingleChildScrollView(
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
                    if (widget.bloc.entity.address!.zipCode.length == 8) {
                      widget.bloc
                          .add(CollaboratorCepEvent(widget.bloc.entity.address!.zipCode));
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
                initialValue: widget.bloc.entity.address!.zipCode,
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateExactLength(value, 8),
                onChanged: (value) {
                  widget.bloc.entity.address!.zipCode = value;
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                widget.bloc.states
                                    .firstWhere(
                                        (element) =>
                                            element.id ==
                                            widget.bloc.entity.address!.tbStateId,
                                        orElse: () => StateModel(name: widget.bloc.entity.address!.stateName))
                                    .name,
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
                                widget.bloc.add(CollaboratorGetStatesEvent());
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                widget.bloc.citys
                                    .firstWhere(
                                        (element) =>
                                            element.id ==
                                            widget.bloc.entity.address!.tbCityId,
                                        orElse: () => CityModel(name: widget.bloc.entity.address!.cityName))
                                    .name,
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
                                widget.bloc.add(CollaboratorGetCitysEvent(
                                    widget.bloc.entity.address!.tbStateId.toString()));
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
                initialValue: widget.bloc.entity.address!.street,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.address!.street = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Número',
                initialValue: widget.bloc.entity.address!.nmbr,
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.address!.nmbr = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Complemento',
                initialValue: widget.bloc.entity.address!.complement,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.entity.address!.complement = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Bairro',
                initialValue: widget.bloc.entity.address!.neighborhood,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.done,
                onChanged: (value) {
                  widget.bloc.entity.address!.neighborhood = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
