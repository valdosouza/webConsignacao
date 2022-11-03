import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_state.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopCollaborator extends StatefulWidget {
  const ContentDesktopCollaborator({super.key});

  @override
  State<ContentDesktopCollaborator> createState() =>
      _ContentDesktopCollaboratorState();
}

class _ContentDesktopCollaboratorState
    extends State<ContentDesktopCollaborator> {
  late final CollaboratorBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<CollaboratorBloc>();
    bloc.add(LoadCollaboratorEvent(institution: 1));
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollaboratorBloc, CollaboratorState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CollaboratorDeleteSuccessState) {
          CustomToast.showToast("Colaborador removido com sucesso.");
        } else if (state is CollaboratorDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover o colaborador. Tente novamente mais tarde.");
        } else if (state is CollaboratorAddSuccessState) {
          CustomToast.showToast("Colaborador adicionado com sucesso");
          bloc.add(LoadCollaboratorEvent(institution: 1));
        } else if (state is CollaboratorAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar o colaborador. Tente novamente mais tarde.");
        } else if (state is CollaboratorEditSuccessState) {
          CustomToast.showToast("Colaborador editado com sucesso");
          bloc.add(LoadCollaboratorEvent(institution: 1));
        } else if (state is CollaboratorPutErrorState) {
          CustomToast.showToast(
              "Erro ao editar o colaborador. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is CollaboratorInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CollaboratorInterationPageState) {
          Modular.to.pushReplacementNamed(
              '/resourcehuman/content/collaborator/register/',
              arguments: state.collaborator);
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final collaboratorList = state.collaboratorList;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de colaboradores'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.collaborators.last.id + 1;
                  CollaboratorModel model =
                      CollaboratorModel(id: bloc.collaborators.last.id + 1);
                  bloc.add(CollaboratorInterationEvent(collaborator: model));
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
                    child: collaboratorList.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum registros em nossa base."))
                        : ListView.separated(
                            itemCount: collaboratorList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.add(CollaboratorInterationEvent(
                                    collaborator: collaboratorList[index]));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(
                                        collaboratorList[index].id.toString()),
                                  ),
                                ),
                                title: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Text(collaboratorList[index]
                                          .entity!
                                          .nameCompany),
                                      const VerticalDivider(),
                                      Text(collaboratorList[index]
                                          .entity!
                                          .nickTrade),
                                      const VerticalDivider(),
                                      Text(collaboratorList[index]
                                          .entity!
                                          .nameLineBussiness),
                                    ],
                                  ),
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
        autofocus: true,
        onChanged: (value) {
          bloc.add(SearchCollaboratorEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise colaboradores",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
