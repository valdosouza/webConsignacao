// ignore_for_file: unnecessary_const

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_state.dart';
import 'package:appweb/app/modules/institution_register/presentation/pages/institution_lists_page.dart';
import 'package:appweb/app/modules/institution_register/presentation/widgets/institution_address_widget.dart';
import 'package:appweb/app/modules/institution_register/presentation/widgets/institution_identification_widget.dart';
import 'package:appweb/app/modules/institution_register/presentation/widgets/institution_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopInstitutionRegister extends StatefulWidget {
  const ContentDesktopInstitutionRegister({super.key});

  @override
  State<ContentDesktopInstitutionRegister> createState() =>
      _ContentDesktopInstitutionRegisterState();
}

class _ContentDesktopInstitutionRegisterState
    extends State<ContentDesktopInstitutionRegister>
    with SingleTickerProviderStateMixin {
  late final InstitutionBloc bloc;
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
    bloc = Modular.get<InstitutionBloc>();
    bloc.add(InstitutionGetEvent());
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<InstitutionBloc, InstitutionState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is InstitutionPostSuccessState) {
            CustomToast.showToast("Cadastro realizado com sucesso.");
          } else if (state is InstitutionPutSuccessState) {
            CustomToast.showToast("Cadastro atualizado com sucesso.");
          } else if (state is InstitutionPostErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao salvar. Tente novamente mais tarde.");
          } else if (state is InstitutionPutErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao atualizar. Tente novamente mais tarde.");
          } else if (state is InstitutionGetErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar seu estabelecimento. Tente novamente mais tarde.");
          } else if (state is InstitutionCnpjErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar por cnpj. Tente novamente mais tarde.");
          } else if (state is InstitutionGetCityErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar a lista de cidades. Tente novamente mais tarde.");
          } else if (state is InstitutionGetStatesErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar a lista de estados. Tente novamente mais tarde.");
          } else if (state is InstitutionReturnedState) {
            _tabController.animateTo(1);
          }
        },
        builder: (context, state) {
          if (state is InstitutionLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is InstitutionGetStatesSuccessState ||
              state is InstitutionGetCitySuccessState) {
            return const InstitutionListsPage();
          }
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cadastro do Estabelecimento",
                    style: kHintTextStyle.copyWith(fontSize: 32.0),
                  ),
                  const SizedBox(width: 100.0),
                  IconButton(
                    onPressed: () {
                      if (Validators.validateCNPJ(bloc.institution.cnpj) !=
                          null) {
                        CustomToast.showToast(
                            Validators.validateCNPJ(bloc.institution.cnpj)!);
                      } else if (Validators.validateExactLength(
                              bloc.institution.zipCode, 8) !=
                          null) {
                        CustomToast.showToast("CEP inválido.");
                      } else {
                        if (bloc.institution.id != 0) {
                          bloc.add(
                              InstitutionPutEvent(model: bloc.institution));
                        } else {
                          bloc.add(
                              InstitutionSaveEvent(model: bloc.institution));
                        }
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
                InstituitionIdentificationWidget(
                  bloc: bloc,
                  formKey: _formKey,
                ),
                InstituitionAddressWidget(
                  bloc: bloc,
                  formK: _formK,
                ),
                InstituitionPhoneWidget(bloc: bloc),
              ],
            ),
          );
        },
      ),
    );
  }
}
