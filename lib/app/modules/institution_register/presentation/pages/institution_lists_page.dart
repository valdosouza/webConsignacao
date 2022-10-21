import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_bloc.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_event.dart';
import 'package:appweb/app/modules/institution_register/presentation/bloc/institution_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InstitutionListsPage extends StatefulWidget {
  const InstitutionListsPage({
    super.key,
  });

  @override
  State<InstitutionListsPage> createState() => _InstitutionListsPageState();
}

class _InstitutionListsPageState extends State<InstitutionListsPage> {
  late final InstitutionBloc bloc;

  @override
  void initState() {
    bloc = Modular.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstitutionBloc, InstitutionState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is InstitutionGetStatesSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de estados'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(InstitutionReturnEvent());
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
                                  bloc.entity.tbStateId =
                                      state.states[index].id;
                                  bloc.add(InstitutionReturnEvent());
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
        } else if (state is InstitutionGetCitySuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de cidades'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(InstitutionReturnEvent());
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
                                  bloc.entity.tbCityId = state.citys[index].id;
                                  bloc.add(InstitutionReturnEvent());
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
        } else {
          return Container();
        }
      },
    );
  }
}
