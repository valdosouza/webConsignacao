// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_state.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/content/content_desktop_collaborator_register.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/content/content_mobile_collaborator_register.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/content/content_tablet_collaborator_register.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class CollaboratorRegister extends StatefulWidget {
  CollaboratorModel collaborator;

  CollaboratorRegister({
    Key? key,
    required this.collaborator,
  }) : super(key: key);

  @override
  State<CollaboratorRegister> createState() => _CollaboratorRegisterState();
}

class _CollaboratorRegisterState extends State<CollaboratorRegister> {
  @override
  void initState() {
    Modular.get<CollaboratorRegisterBloc>().entity = widget.collaborator!;
    Modular.get<CollaboratorRegisterBloc>().add(CollaboratorLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileCollaboratorRegister(),
      tablet: ContentTabletCollaboratorRegister(),
      desktop: ContentDesktopCollaboratorRegister(),
    );
  }
}
