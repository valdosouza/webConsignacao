import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_state.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/page/collaborator_register_interation_page.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/page/collaborator_register_lists_page.dart';
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
    extends State<ContentDesktopCollaboratorRegister> {
  late final CollaboratorRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CollaboratorRegisterModule>();
    });
    bloc = Modular.get<CollaboratorRegisterBloc>();
    bloc.add(CollaboratorRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollaboratorRegisterBloc, CollaboratorRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CollaboratorRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde");
        } else if (state is CollaboratorRegisterCnpjErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is CollaboratorRegisterPostSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is CollaboratorRegisterPostErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is CollaboratorRegisterGetErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados do cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is CollaboratorRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CollaboratorRegisterGetCitySuccessState ||
            state is CollaboratorRegisterGetStatesSuccessState ||
            state is CollaboratorRegisterGetLinebusinessSuccessState) {
          return const CollaboratorRegisterListsPage();
        }

        if ((state is CollaboratorRegisterInfoPageState) ||
            (state is CollaboratorRegisterCnpjErrorState)) {
          return CollaboratorRegisterInterationPage(
            tabIndex: state.tabIndex,
          );
        }
        final modelList = state.modelList;
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const Text('Lista de Colaboradoress'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.model = CollaboratorMainModel.empty();
                  bloc.add(CollaboratorRegisterInfoEvent());
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSearchInput(),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: modelList.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum registro em nossa base."))
                        : ListView.separated(
                            itemCount: modelList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.add(CollaboratorRegisterInfoEvent(
                                    id: modelList[index].id));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: (Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Nome: ${modelList[index].nameCompany}"),
                                    const SizedBox(height: 5.0),
                                    modelList[index].docKind == "J"
                                        ? Text(
                                            "CNPJ: ${modelList[index].docNumber}")
                                        : Text(
                                            "CPF: ${modelList[index].docNumber}"),
                                    const SizedBox(height: 5.0),
                                    Text(
                                        "Cargo: ${modelList[index].nameLineBusiness}"),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    CustomToast.showToast(
                                        "Funcionalidade em desenvolvimento.");
                                  },
                                ),
                              ),
                            ),
                            separatorBuilder: (_, __) => const Divider(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        onChanged: (value) {
          bloc.add(CollaboratorRegisterSearchEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise seu colaborador por nome, cnpj ou cpf",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
