import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:flutter/material.dart';

class CollaboratorRegisterOthersWidget extends StatefulWidget {
  final CollaboratorRegisterBloc bloc;
  final CollaboratorMainModel? collaborator;
  const CollaboratorRegisterOthersWidget({
    super.key,
    this.collaborator,
    required this.bloc,
  });

  @override
  State<CollaboratorRegisterOthersWidget> createState() =>
      _CollaboratorRegisterOthersWidgetState();
}

class _CollaboratorRegisterOthersWidgetState
    extends State<CollaboratorRegisterOthersWidget> {
  @override
  Widget build(BuildContext context) {
    bool active = (widget.collaborator?.collaborator.active == "S");
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
                            widget.collaborator?.collaborator.active = "S";
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
                              widget.collaborator?.collaborator.active = "N";
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            widget.collaborator?.entity.nameLinebusiness ?? "",
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
                            widget.bloc.add(
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
