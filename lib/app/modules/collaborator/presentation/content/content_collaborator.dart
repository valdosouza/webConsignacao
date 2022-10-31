import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/collaborator/presentation/content/content_desktop_collaborator.dart';
import 'package:appweb/app/modules/collaborator/presentation/content/content_mobile_collaborator.dart';
import 'package:appweb/app/modules/collaborator/presentation/content/content_tablet_collaborator.dart';

import 'package:flutter/material.dart';

class ContentCollaboratorList extends StatelessWidget {
  const ContentCollaboratorList({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Responsive(
      mobile: ContentMobileCollaborator(),
      tablet: ContentTabletCollaborator(),
      desktop: ContentDesktopCollaborator(),
    );
  }
}
