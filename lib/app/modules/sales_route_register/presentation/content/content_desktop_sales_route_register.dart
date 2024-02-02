import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';

import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_bloc.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_event.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_state.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/page/sales_route_register_interation_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopSalesRouteRegister extends StatefulWidget {
  const ContentDesktopSalesRouteRegister({super.key});

  @override
  State<ContentDesktopSalesRouteRegister> createState() =>
      _ContentDesktopSalesRouteRegisterState();
}

class _ContentDesktopSalesRouteRegisterState
    extends State<ContentDesktopSalesRouteRegister> {
  late final SalesRouteRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<SalesRouteRegisterBloc>();
    bloc.add(SalesRouteRegisterGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesRouteRegisterBloc, SalesRouteRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SalesRouteRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is SalesRouteRegisterAddSuccessState) {
          CustomToast.showToast("Cadastro adicionado com sucesso.");
        } else if (state is SalesRouteRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is SalesRouteRegisterEditSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is SalesRouteRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is SalesRouteRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else if (state is SalesRouteRegisterInfoPageState) {
          return SalesRouteRegisterInterationPage(
            model: state.model,
          );
        }
        final routes = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const AutoSizeText(
              'Lista de Rotas',
              style: kTitleAppBarStyle,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add, color: kSecondaryColor),
                onPressed: () {
                  bloc.add(SalesRouteRegisterAddEvent());
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
                                bloc.add(SalesRouteRegisterEditEvent());
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: (Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(
                                      (index + 1).toString(),
                                      style: kCircleAvatarTextStyle,
                                    ),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(routes[index].description),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove,
                                      color: kSecondaryColor),
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
          bloc.add(SalesRouteRegisterSearchEvent(search: value));
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
