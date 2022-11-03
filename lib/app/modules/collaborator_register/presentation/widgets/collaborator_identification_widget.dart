import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_identification_person_widget.dart';
import 'package:flutter/material.dart';

class CollaboratorIdentificationWidget extends StatefulWidget {
  final CollaboratorRegisterBloc bloc;
  final GlobalKey formKey;
  const CollaboratorIdentificationWidget({
    super.key,
    required this.bloc,
    required this.formKey,
  });

  @override
  State<CollaboratorIdentificationWidget> createState() =>
      _CollaboratorIdentificationWidgetState();
}

class _CollaboratorIdentificationWidgetState
    extends State<CollaboratorIdentificationWidget> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: CollaboratorIdentificationPersonWidget(
            bloc: widget.bloc, formKey: widget.formKey));
  }
}
