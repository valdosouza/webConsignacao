// ignore_for_file: unnecessary_const

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_state.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/pages/collaborator_lists_page.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_address_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_identification_widget.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/widgets/collaborator_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopCollaboratorRegister extends StatefulWidget {
  const ContentDesktopCollaboratorRegister({super.key});

  @override
  State<ContentDesktopCollaboratorRegister> createState() =>
      _ContentDesktopCollaboratorRegisterState();
}

class _ContentDesktopCollaboratorRegisterState
    extends State<ContentDesktopCollaboratorRegister>
    with SingleTickerProviderStateMixin {
  late final CollaboratorRegisterBloc bloc;
  final _formKey = GlobalKey<FormState>();
  final _formK = GlobalKey<FormState>();
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Dados Principais'),
    const Tab(text: 'Endereço'),
    const Tab(text: 'Telefone'),
  ];

  @override
  void initState() {
    bloc = Modular.get<CollaboratorRegisterBloc>();
    bloc.add(CollaboratorGetEvent(collaboratorId: bloc.entity.id));
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<CollaboratorRegisterBloc, CollaboratorState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CollaboratorPostSuccessState) {
            CustomToast.showToast("Cadastro realizado com sucesso.");
            Modular.to.pushReplacementNamed("/admin/content/institution/");
          } else if (state is CollaboratorPostErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao salvar. Tente novamente mais tarde.");
          } else if (state is CollaboratorGetCityErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar a lista de cidades. Tente novamente mais tarde.");
          } else if (state is CollaboratorGetStatesErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar a lista de estados. Tente novamente mais tarde.");
          } else if (state is CollaboratorGetLineBusinessErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar a lista de cargos. Tente novamente mais tarde.");
          } else if (state is CollaboratorReturnedState) {
            _tabController.animateTo(state.returnTo);
          }
        },
        builder: (context, state) {
          if (state is CollaboratorLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CollaboratorGetStatesSuccessState ||
              state is CollaboratorGetCitySuccessState ||
              state is CollaboratorGetLineBusinessSuccessState) {
            return const CollaboratorListsPage();
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromARGB(255, 229, 57, 57),
                        Color.fromARGB(255, 224, 71, 71),
                        Color.fromARGB(255, 241, 97, 97),
                      ]),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cadastro do Colaborador",
                    style: kHintTextStyle.copyWith(fontSize: 32.0),
                  ),
                  const SizedBox(width: 100.0),
                  IconButton(
                    onPressed: () {
                      if (Validators.validateExactLength(
                              bloc.entity.address!.zipCode, 8) !=
                          null) {
                        CustomToast.showToast("CEP inválido.");
                      } else if (Validators.validateCPF(
                              bloc.entity.person!.cpf) !=
                          null) {
                        CustomToast.showToast("CPF inválido.");
                      } else {
                        bloc.add(CollaboratorSaveEvent());
                      }
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
                CollaboratorIdentificationWidget(
                  bloc: bloc,
                  formKey: _formKey,
                ),
                CollaboratorAddressWidget(
                  bloc: bloc,
                  formK: _formK,
                ),
                CollaboratorPhoneWidget(bloc: bloc),
              ],
            ),
          );
        },
      ),
    );
  }
}
