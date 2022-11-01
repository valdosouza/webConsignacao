import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorListsPage extends StatefulWidget {
  const CollaboratorListsPage({
    super.key,
  });

  @override
  State<CollaboratorListsPage> createState() => _CollaboratorListsPageState();
}

class _CollaboratorListsPageState extends State<CollaboratorListsPage> {
  late final CollaboratorRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollaboratorRegisterBloc, CollaboratorState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CollaboratorGetStatesSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de estados'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CollaboratorReturnEvent(screenIndex: 1));
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        onChanged: (value) {
                          bloc.add(SearchStateEvent(search: value));
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: "Pesquise aqui",
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Expanded(
                      child: state.states.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhum estado em nossa base."))
                          : ListView.separated(
                              itemCount: state.states.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.entity.address!.tbStateId =
                                      state.states[index].id;
                                  bloc.add(CollaboratorReturnEvent(screenIndex: 1));
                                },
                                child: ListTile(
                                  leading: Text(
                                      "${state.states[index].name} - ${state.states[index].abbreviation}"),
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
        } else if (state is CollaboratorGetCitySuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de cidades'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CollaboratorReturnEvent(screenIndex: 1));
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        onChanged: (value) {
                          bloc.add(SearchCityEvent(search: value));
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: "Pesquise aqui",
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Expanded(
                      child: state.citys.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhuma cidade em nossa base."))
                          : ListView.separated(
                              itemCount: state.citys.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.entity.address!.tbCityId = state.citys[index].id;
                                  bloc.add(CollaboratorReturnEvent(screenIndex: 1));
                                },
                                child: ListTile(
                                  leading: Text(state.citys[index].name),
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
        } else if(state is CollaboratorGetLineBusinessSuccessState) {
           return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de cargos'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CollaboratorReturnEvent(screenIndex: 0));
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        onChanged: (value) {
                          bloc.add(SearchLineBusinessEvent(search: value));
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: "Pesquise aqui",
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Expanded(
                      child: state.lineBusiness.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhum cargo em nossa base."))
                          : ListView.separated(
                              itemCount: state.lineBusiness.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.entity.entity!.tbLineBussinessId = state.lineBusiness[index].id;
                                  bloc.entity.entity!.nameLineBussiness = state.lineBusiness[index].description;
                                  bloc.add(CollaboratorReturnEvent(screenIndex: 0));
                                },
                                child: ListTile(
                                  leading: Text(state.lineBusiness[index].description),
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
          }else {
          return Container();
        }
      },
    );
  }
}
