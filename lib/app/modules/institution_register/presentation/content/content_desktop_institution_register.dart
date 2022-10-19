// ignore_for_file: unnecessary_const

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_state.dart';
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
                  if (bloc.entity.id != 0) {
                    bloc.add(InstitutionPutEvent());
                  } else {
                    bloc.add(InstitutionSaveEvent());
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
                _buildIdentificationData(),
                _buildAddress(),
                _buildPhone(),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding _buildPhone() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: 'Tipo de Telefone(Celular, residencial)',
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.phoneKind = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Celular',
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.done,
            onChanged: (value) {
              bloc.entity.phoneNumber = value;
            },
          ),
        ],
      ),
    );
  }

  Padding _buildAddress() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: 'CEP',
            sufixIcon: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(InstitutionCepEvent(bloc.entity.zipCode));
              },
              icon: const Icon(
                Icons.search,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            initialValue: bloc.entity.zipCode,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.zipCode = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'UF',
            initialValue: bloc.entity.region,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.region = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Cidade',
            initialValue: bloc.entity.latitude,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.latitude = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Logradouro',
            initialValue: bloc.entity.street,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.street = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Número',
            initialValue: bloc.entity.nmbr,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.nmbr = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Complemento',
            initialValue: bloc.entity.complement,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.complement = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Bairro',
            initialValue: bloc.entity.neighborhood,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.done,
            onChanged: (value) {
              bloc.entity.neighborhood = value;
            },
          ),
        ],
      ),
    );
  }

  Padding _buildIdentificationData() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: 'CNPJ',
            initialValue: bloc.entity.cnpj,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.cnpj = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Nome/Razão Social',
            initialValue: bloc.entity.nameCompany,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.nameCompany = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Apelido/Fantasia',
            initialValue: bloc.entity.nickTrade,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.nickTrade = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInput(
            title: 'Inscrição Estadual',
            initialValue: bloc.entity.ie,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              bloc.entity.ie = value;
            },
          ),
        ],
      ),
    );
  }
}
