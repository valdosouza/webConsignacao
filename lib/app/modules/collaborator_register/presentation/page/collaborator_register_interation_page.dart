import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';

import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_state.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widget/collaborator_register_address_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widget/collaborator_register_identification_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widget/collaborator_register_others_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widget/collaborator_register_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorRegisterInterationPage extends StatefulWidget {
  final int tabIndex;
  const CollaboratorRegisterInterationPage({super.key, required this.tabIndex});

  @override
  State<CollaboratorRegisterInterationPage> createState() =>
      _CollaboratorRegisterInterationPageState();
}

class _CollaboratorRegisterInterationPageState
    extends State<CollaboratorRegisterInterationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late final CollaboratorRegisterBloc bloc;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Principal'),
    const Tab(text: 'Endereço'),
    const Tab(text: 'Fone'),
    const Tab(text: 'Outros'),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CollaboratorRegisterModule>();
    });
    bloc = Modular.get<CollaboratorRegisterBloc>();

    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.animateTo(widget.tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        bloc.add(CollaboratorRegisterGetListEvent());
      },
      child: BlocConsumer<CollaboratorRegisterBloc, CollaboratorRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CollaboratorRegisterCnpjErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined,
                    color: kSecondaryColor),
                onPressed: () {
                  bloc.add(CollaboratorRegisterGetListEvent());
                },
              ),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bloc.model.collaborator.id != 0
                        ? "Editar Colaborador"
                        : "Adicionar Colaborador",
                    style: kHintTextStyle.copyWith(fontSize: 32.0),
                  ),
                  const SizedBox(width: 100.0),
                  IconButton(
                    onPressed: () {
                      bloc.add(CollaboratorRegisterPostEvent());
                    },
                    hoverColor: Colors.transparent,
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorWeight: 2.0,
                indicatorColor: Colors.black,
                tabs: myTabs,
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                CollaboratorRegisterIdentificationWidget(),
                CollaboratorRegisterAddressWidget(),
                CollaboratorRegisterPhoneWidget(),
                CollaboratorRegisterOthersWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
