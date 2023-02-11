import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_bloc.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_event.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_state.dart';
import 'package:appweb/app/modules/price_list_register/presentation/page/price_list_register_interation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopPriceListRegister extends StatefulWidget {
  const ContentDesktopPriceListRegister({super.key});

  @override
  State<ContentDesktopPriceListRegister> createState() =>
      _ContentDesktopPriceListRegisterState();
}

class _ContentDesktopPriceListRegisterState
    extends State<ContentDesktopPriceListRegister> {
  late final PriceListRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<PriceListRegisterBloc>();
    bloc.add(PriceListRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceListRegisterBloc, PriceListRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is PriceListRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is PriceListRegisterAddSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is PriceListRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is PriceListRegisterEditSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is PriceListRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is PriceListRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PriceListRegisterInfoPageState) {
          return const PriceListRegisterInterationPage();
        }
        final prices = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de preços'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(PriceListRegisterAddEvent());
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
                                bloc.add(PriceListRegisterEditEvent());
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
        autofocus: false,
        onChanged: (value) {
          bloc.add(PriceListRegisterSearchEvent(search: value));
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
