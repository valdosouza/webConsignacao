import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/line_business_register/linebusiness_register_module.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_events.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_states.dart';
import 'package:appweb/app/modules/line_business_register/presentation/pages/linebusiness_interaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopLinebusinessRegister extends StatefulWidget {
  const ContentDesktopLinebusinessRegister({super.key});

  @override
  State<ContentDesktopLinebusinessRegister> createState() =>
      _ContentDesktopLinebusinessRegisterState();
}

class _ContentDesktopLinebusinessRegisterState
    extends State<ContentDesktopLinebusinessRegister> {
  late final LinebusinessRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<LinebusinessRegisterModule>();
    });
    bloc = Modular.get<LinebusinessRegisterBloc>();
    bloc.add(LinebusinessRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LinebusinessRegisterBloc, LinebusinessRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LinebusinessRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar a lista. Tente novamente mais tarde.");
        } else if (state is LinebusinessRegisterAddSuccessState) {
          CustomToast.showToast("Cargo adicionado com sucesso.");
        } else if (state is LinebusinessRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar Cargo. Tente novamente mais tarde.");
        } else if (state is LinebusinessRegisterEditSuccessState) {
          CustomToast.showToast("Cargo editado com sucesso.");
        } else if (state is LinebusinessRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao editar Cargo. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is LinebusinessRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LinebusinessRegisterInfoPageState) {
          return LinebusinessRegisterInterationPage(
            model: state.model,
            index: state.list.last.id,
          );
        }
        final prices = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cargos'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(LinebusinessRegisterInfoEvent());
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
                                "Não encontramos nenhum dado em nossa base."))
                        : ListView.separated(
                            itemCount: prices.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.add(LinebusinessRegisterInfoEvent(
                                    model: prices[index]));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(prices[index].description),
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
        autofocus: true,
        onChanged: (value) {
          bloc.add(LinebusinessRegisterSearchEvent(search: value));
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
