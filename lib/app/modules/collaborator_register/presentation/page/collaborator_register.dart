import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/content/content_desktop_collaborator_register.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/content/content_mobile_collaborator_register.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/content/content_tablet_collaborator_register.dart';
import 'package:flutter/material.dart';

class ContentCollaboratorRegister extends StatelessWidget {
  const ContentCollaboratorRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileCollaboratorRegister(),
      tablet: ContentTabletCollaboratorRegister(),
      desktop: ContentDesktopCollaboratorRegister(),
    );
  }
}
