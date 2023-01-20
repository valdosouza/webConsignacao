import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorRegisterOthersWidget extends StatefulWidget {
  const CollaboratorRegisterOthersWidget({super.key});

  @override
  State<CollaboratorRegisterOthersWidget> createState() =>
      _CollaboratorRegisterOthersWidgetState();
}

class _CollaboratorRegisterOthersWidgetState
    extends State<CollaboratorRegisterOthersWidget> {
  late final CollaboratorRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CollaboratorRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    bool active = (bloc.model.collaborator.active == "S");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Ativo", style: kLabelStyle),
          const SizedBox(height: 0.0),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: active,
                    activeColor: Colors.red,
                    onChanged: active
                        ? (value) {}
                        : (value) {
                            setState(() {
                              active = true;
                            });
                            bloc.model.collaborator.active = "S";
                          },
                  ),
                  const SizedBox(width: 5.0),
                  const Text("Sim", style: kLabelStyle),
                ],
              ),
              const SizedBox(width: 10.0),
              Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: active,
                      activeColor: Colors.red,
                      onChanged: active
                          ? (value) {
                              setState(() {
                                active = false;
                              });
                              bloc.model.collaborator.active = "N";
                            }
                          : (value) {}),
                  const SizedBox(width: 5.0),
                  const Text("Não", style: kLabelStyle),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cargo",
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
                            bloc.model.entity.nameLinebusiness,
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
                            bloc.add(
                                CollaboratorRegisterGetLineBusinessEvent());
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
        ],
      ),
    );
  }
}
