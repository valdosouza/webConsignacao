import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';

import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_bloc.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_event.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_state.dart';
import 'package:appweb/app/modules/region_register/presentation/page/region_register_interation_page.dart';
import 'package:appweb/app/modules/region_register/presentation/widget/region_register_salesman_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopRegionRegister extends StatefulWidget {
  const ContentDesktopRegionRegister({super.key});

  @override
  State<ContentDesktopRegionRegister> createState() =>
      _ContentDesktopRegionRegisterState();
}

class _ContentDesktopRegionRegisterState
    extends State<ContentDesktopRegionRegister> {
  late final RegionRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<RegionRegisterBloc>();
    bloc.add(RegionRegisterGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionRegisterBloc, RegionRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is RegionRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is RegionRegisterAddSuccessState) {
          CustomToast.showToast("Cadastro adicionado com sucesso.");
        } else if (state is RegionRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is RegionRegisterEditSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is RegionRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is RegionRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else if (state is RegionRegisterGetSalesmanSuccessState) {
          return const RegionRegisterSalesmanListWidget();
        } else if (state is RegionRegisterInfoPageState) {
          return const RegionRegisterInterationPage();
        }
        final routes = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Regiões'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(RegionRegisterAddEvent());
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
                    child: routes.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum registro em nossa base."))
                        : ListView.separated(
                            itemCount: routes.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.model = routes[index];
                                bloc.add(RegionRegisterEditEvent());
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: (Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(routes[index].description),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(routes[index].salesmanName),
                                    ),
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
          bloc.add(RegionRegisterSearchEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise pelo nome",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
