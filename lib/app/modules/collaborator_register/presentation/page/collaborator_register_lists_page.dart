import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/collaborator_register/collaborator_register_module.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_bloc.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_event.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CollaboratorRegisterListsPage extends StatefulWidget {
  const CollaboratorRegisterListsPage({
    super.key,
  });

  @override
  State<CollaboratorRegisterListsPage> createState() =>
      _CollaboratorRegisterListsPageState();
}

class _CollaboratorRegisterListsPageState
    extends State<CollaboratorRegisterListsPage> {
  late final CollaboratorRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CollaboratorRegisterModule>();
    });
    bloc = Modular.get<CollaboratorRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollaboratorRegisterBloc, CollaboratorRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CollaboratorRegisterGetStatesSuccessState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de estados'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CollaboratorRegisterReturnEvent(index: 1));
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
                          bloc.add(CollaboratorRegisterSearchStateEvent(
                              search: value));
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
                                  bloc.collaborator.address.tbStateId =
                                      state.states[index].id;
                                  bloc.collaborator.address.stateName =
                                      state.states[index].name;
                                  bloc.add(CollaboratorRegisterReturnEvent(
                                      index: 1));
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
        } else if (state is CollaboratorRegisterGetCitySuccessState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de cidades'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CollaboratorRegisterReturnEvent(index: 1));
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
                          bloc.add(CollaboratorRegisterSearchCityEvent(
                              search: value));
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
                      child: state.cities.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhuma cidade em nossa base."))
                          : ListView.separated(
                              itemCount: state.cities.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.collaborator.address.tbCityId =
                                      state.cities[index].id;
                                  bloc.collaborator.address.cityName =
                                      state.cities[index].name;
                                  bloc.add(CollaboratorRegisterReturnEvent(
                                      index: 1));
                                },
                                child: ListTile(
                                  leading: Text(state.cities[index].name),
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
        } else if (state is CollaboratorRegisterGetLinebusinessSuccessState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de Cargos'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CollaboratorRegisterReturnEvent(index: 3));
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
                          bloc.add(CollaboratorRegisterSearchLinebusinessEvent(
                              search: value));
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
                      child: state.linebusiness.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhum vendedor em nossa base."))
                          : ListView.separated(
                              itemCount: state.linebusiness.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.collaborator.entity.tbLineBusinessId =
                                      state.linebusiness[index].id;
                                  bloc.collaborator.entity.nameLinebusiness =
                                      state.linebusiness[index].description;
                                  bloc.add(CollaboratorRegisterReturnEvent(
                                      index: 3));
                                },
                                child: ListTile(
                                  leading: Text(
                                      state.linebusiness[index].description),
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
        } else {
          return Container();
        }
      },
    );
  }
}
