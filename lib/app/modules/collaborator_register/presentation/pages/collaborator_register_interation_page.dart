import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_state.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_register_address_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_register_identification_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_register_others_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_register_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorRegisterInterationPage extends StatefulWidget {
  final CollaboratorMainModel collaborator;
  final int tabIndex;
  const CollaboratorRegisterInterationPage({
    Key? key,
    required this.collaborator,
    required this.tabIndex,
  }) : super(key: key);

  @override
  State<CollaboratorRegisterInterationPage> createState() =>
      _CollaboratorRegisterInterationPageState();
}

class _CollaboratorRegisterInterationPageState
    extends State<CollaboratorRegisterInterationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late CollaboratorMainModel collaborator;

  late final CollaboratorRegisterBloc bloc;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Dados Principais'),
    const Tab(text: 'Endereço'),
    const Tab(text: 'Telefone'),
    const Tab(text: 'Outros'),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CollaboratorRegisterModule>();
    });
    bloc = Modular.get<CollaboratorRegisterBloc>();
    collaborator = widget.collaborator;
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.animateTo(widget.tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(CollaboratorRegisterGetListEvent());
        return true;
      },
      child: BlocConsumer<CollaboratorRegisterBloc, CollaboratorRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CollaboratorRegisterCnpjErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar por cnpj. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CollaboratorRegisterGetListEvent());
                },
              ),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    collaborator.collaborator.id != 0
                        ? "Editar Colaborador"
                        : "Adicionar Colaborador",
                    style: kHintTextStyle.copyWith(fontSize: 32.0),
                  ),
                  const SizedBox(width: 100.0),
                  IconButton(
                    onPressed: () {
                      bloc.add(CollaboratorRegisterPostEvent(
                          model: bloc.collaborator));
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
              children: <Widget>[
                CollaboratorRegisterIdentificationWidget(
                  bloc: bloc,
                  collaborator: collaborator,
                ),
                CollaboratorRegisterAddressWidget(
                  bloc: bloc,
                  collaborator: collaborator,
                ),
                CollaboratorRegisterPhoneWidget(
                  bloc: bloc,
                  collaborator: collaborator,
                ),
                CollaboratorRegisterOthersWidget(
                  bloc: bloc,
                  collaborator: collaborator,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
