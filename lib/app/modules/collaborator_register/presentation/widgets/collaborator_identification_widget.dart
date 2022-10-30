import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_identification_company_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_identification_person_widget.dart';
import 'package:flutter/material.dart';

class CollaboratorIdentificationWidget extends StatefulWidget {
  final CollaboratorBloc bloc;
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
  // Inicia os verificadores do radioGroup como pessoa fisica
  bool isSelectEntityType = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              children: [
                Radio(
                    value: true,
                    groupValue: isSelectEntityType,
                    onChanged: isSelectEntityType
                        ? (value) {}
                        : (value) {
                            setState(() {
                              isSelectEntityType = true;
                            });
                          }),
                const Text("Pessoa Física")
              ],
            ),
            const SizedBox(width: 15),
            Row(
              children: [
                Radio(
                    value: false,
                    groupValue: isSelectEntityType,
                    onChanged: isSelectEntityType
                        ? (value) {
                            setState(() {
                              isSelectEntityType = false;
                            });
                          }
                        : (value) {}),
                const Text("Pessoa Jurídica")
              ],
            ),
          ],
        ),
        Container(
          child: isSelectEntityType
              ? CollaboratorIdentificationPersonWidget(
                  bloc: widget.bloc, formKey: widget.formKey)
              : CollaboratorIdentificationCompanyWidget(
                  bloc: widget.bloc, formKey: widget.formKey),
        ),
      ]),
    );
  }
}
