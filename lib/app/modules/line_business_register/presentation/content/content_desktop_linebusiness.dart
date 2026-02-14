import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_event.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_state.dart';
import 'package:appweb/app/modules/line_business_register/presentation/page/linebusiness_register_interation_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopLinebusiness extends StatefulWidget {
  const ContentDesktopLinebusiness({super.key});

  @override
  State<ContentDesktopLinebusiness> createState() =>
      _ContentDesktopLinebusinessState();
}

class _ContentDesktopLinebusinessState
    extends State<ContentDesktopLinebusiness> {
  late final LinebusinessRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<LinebusinessRegisterBloc>();
    bloc.add(LinebusinessGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LinebusinessRegisterBloc, LinebusinessRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LinebusinessErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is LinebusinessAddSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is LinebusinessAddErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is LinebusinessEditSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is LinebusinessEditErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar Lista o cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is LinebusinessLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else if (state is LinebusinessInfoPageState) {
          return const LinebusinessInterationPage();
        }
        final prices = state.list;
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const AutoSizeText(
              'Lista de cargos',
              style: kTitleAppBarStyle,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add, color: kSecondaryColor),
                onPressed: () {
                  bloc.add(LinebusinessAddEvent());
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
                    child: prices.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum registro em nossa base."))
                        : ListView.separated(
                            itemCount: prices.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.model = prices[index];
                                bloc.add(LinebusinessEditEvent());
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
                                    Text(prices[index].description),
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
          bloc.add(LinebusinessSearchEvent(search: value));
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
