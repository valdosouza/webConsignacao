import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:flutter/material.dart';

class InstituitionAddressWidget extends StatefulWidget {
  final InstitutionBloc bloc;
  final GlobalKey formK;
  const InstituitionAddressWidget({
    super.key,
    required this.bloc,
    required this.formK,
  });

  @override
  State<InstituitionAddressWidget> createState() =>
      _InstituitionAddressWidgetState();
}

class _InstituitionAddressWidgetState extends State<InstituitionAddressWidget> {
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
                    if (widget.bloc.institution.zipCode.length == 8) {
                      widget.bloc.add(
                          InstitutionCepEvent(widget.bloc.institution.zipCode));
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
                initialValue: widget.bloc.institution.zipCode,
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                validator: (value) => Validators.validateExactLength(value, 8),
                onChanged: (value) {
                  widget.bloc.institution.zipCode = value;
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
                                          widget.bloc.institution.tbStateId,
                                      orElse: () => StateModel(
                                          name: widget
                                              .bloc.institution.nameState),
                                    )
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
                                widget.bloc.add(InstitutionGetStatesEvent());
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
                                widget.bloc.cities
                                    .firstWhere(
                                      (element) =>
                                          element.id ==
                                          widget.bloc.institution.tbCityId,
                                      orElse: () => CityModel(
                                          name:
                                              widget.bloc.institution.nameCity),
                                    )
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
                                widget.bloc.add(InstitutionGetCitiesEvent(
                                    widget.bloc.institution.tbStateId));
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
                initialValue: widget.bloc.institution.street,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.institution.street = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Número',
                initialValue: widget.bloc.institution.nmbr,
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.institution.nmbr = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Complemento',
                initialValue: widget.bloc.institution.complement,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  widget.bloc.institution.complement = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomInput(
                title: 'Bairro',
                initialValue: widget.bloc.institution.neighborhood,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.done,
                onChanged: (value) {
                  widget.bloc.institution.neighborhood = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
