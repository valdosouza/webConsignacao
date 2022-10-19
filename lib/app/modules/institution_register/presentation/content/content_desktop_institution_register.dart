// ignore_for_file: unnecessary_const

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_state.dart';
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
    extends State<ContentDesktopInstitutionRegister> {
  late final InstitutionBloc bloc;
  final _formKey = GlobalKey<FormState>();
  final _formK = GlobalKey<FormState>();
  @override
  void initState() {
    bloc = Modular.get<InstitutionBloc>();
    bloc.add(InstitutionGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                "Cadastro do Estabelecimento",
                style: kHintTextStyle.copyWith(fontSize: 32.0),
              ),
              const SizedBox(width: 100.0),
              IconButton(
                onPressed: () {
                  if (_formK.currentState != null) {
                    if (_formK.currentState!.validate()) {
                      if (bloc.entity.id != 0) {
                        bloc.add(InstitutionPutEvent());
                      } else {
                        bloc.add(InstitutionSaveEvent());
                      }
                    } else {
                      CustomToast.showToast("Ops...Revise seu CEP para.");
                    }
                  } else if (_formKey.currentState != null) {}
                  if (_formKey.currentState!.validate()) {
                    if (bloc.entity.id != 0) {
                      bloc.add(InstitutionPutEvent());
                    } else {
                      bloc.add(InstitutionSaveEvent());
                    }
                  } else {
                    CustomToast.showToast(
                        "Ops...Reviseseu CNPJ para continuar.");
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
            indicatorWeight: 2.0,
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Text(
                "Dados Principais",
                style: kHintTextStyle.copyWith(fontSize: 22.0),
              ),
              Text(
                "Endereço",
                style: kHintTextStyle.copyWith(fontSize: 22.0),
              ),
              Text(
                "Telefone",
                style: kHintTextStyle.copyWith(fontSize: 22.0),
              ),
            ],
          ),
        ),
        body: BlocConsumer<InstitutionBloc, InstitutionState>(
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
            }
          },
          builder: (context, state) {
            if (state is InstitutionLoadingState) {
              return const TabBarView(
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                  Center(child: CircularProgressIndicator()),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return TabBarView(
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
            );
          },
        ),
      ),
    );
  }
}
