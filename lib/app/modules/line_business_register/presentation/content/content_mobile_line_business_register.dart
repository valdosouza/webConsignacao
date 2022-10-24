import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_events.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentLineBusinessRegisterMobile extends StatefulWidget {
  const ContentLineBusinessRegisterMobile({super.key});

  @override
  State<ContentLineBusinessRegisterMobile> createState() => _ContentLineBusinessRegisterMobileState();
}

class _ContentLineBusinessRegisterMobileState extends State<ContentLineBusinessRegisterMobile> {
   late final LineBusinessBloc bloc;
  bool checkActiveBox = false;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<LineBusinessBloc>();
    bloc.add(LineBusinessGetlistEvent(idInstitution: 1));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LineBusinessBloc, LineBusinessState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LineBusinessDeleteSuccessState) {
          CustomToast.showToast("Cargo removido com sucesso.");
        } else if (state is LineBusinessDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover o cargo. Tente novamente mais tarde.");
        } else if (state is LineBusinessAddSuccessState) {
          CustomToast.showToast("Cargo adicionado com sucesso");
          bloc.add(LineBusinessGetlistEvent(idInstitution: 1));
        } else if (state is LineBusinessAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar o cargo. Tente novamente mais tarde.");
        } else if (state is LineBusinessPutSuccessState) {
          CustomToast.showToast("Cargo editado com sucesso");
          bloc.add(LineBusinessGetlistEvent(idInstitution: 1));
        } else if (state is LineBusinessPutErrorState) {
          CustomToast.showToast(
              "Erro ao editar o cargo. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is LineBusinessInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final lineBusinessList = state.lineBusiness;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Cargos'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  Modular.to
                      .pushNamed('/linebusiness/interaction', arguments: null);
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
                  Row(
                    children: [
                      Flexible(flex: 5, child: _buildSearchInput()),
                      Flexible(child: _checkActive()),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: lineBusinessList.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum cargo em nossa base."))
                        : ListView.separated(
                            itemCount: lineBusinessList.length,
                            itemBuilder: (context, index) {
                              bool checkActiveShow =
                                  !lineBusinessList[index].active &&
                                      checkActiveBox;
                              if (lineBusinessList[index].active || checkActiveShow) {
                                return InkWell(
                                  onTap: () {
                                    Modular.to.pushNamed(
                                        '/linebusiness/interaction',
                                        arguments: lineBusinessList[index]);
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Text(lineBusinessList[index]
                                            .id
                                            .toString()),
                                      ),
                                    ),
                                    title: Text(
                                        lineBusinessList[index].description),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        bloc.add(LineBusinessDeleteEvent(
                                            idLineBusiness:
                                                lineBusinessList[index].id));
                                        CustomToast.showToast(
                                            "Funcionalidade em desenvolvimento.");
                                      },
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                            separatorBuilder: (_, index) {
                              bool checkActiveShow =
                                  !lineBusinessList[index].active &&
                                      checkActiveBox;
                              if (lineBusinessList[index].active || checkActiveShow) {
                                return const Divider();
                              }
                              return const SizedBox.shrink();
                            }),
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
          bloc.add(LineBusinessSearchEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise seu cargo",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  _checkActive() {
    return Row(
      children: [
        Checkbox(
            value: checkActiveBox,
            onChanged: ((value) => {
                  setState(() {
                    checkActiveBox = !checkActiveBox;
                  })
                })),
        const Text("Desativados")
      ],
    );
  }
}