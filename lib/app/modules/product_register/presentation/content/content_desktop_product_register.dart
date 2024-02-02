import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_bloc.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_event.dart';
import 'package:appweb/app/modules/product_register/presentation/bloc/product_register_state.dart';
import 'package:appweb/app/modules/product_register/presentation/page/product_register_interation_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopProductRegister extends StatefulWidget {
  const ContentDesktopProductRegister({super.key});

  @override
  State<ContentDesktopProductRegister> createState() =>
      _ContentDesktopProductRegisterState();
}

class _ContentDesktopProductRegisterState
    extends State<ContentDesktopProductRegister> {
  late final ProductRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<ProductRegisterBloc>();
    bloc.add(ProductRegisterGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductRegisterBloc, ProductRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is ProductRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is ProductRegisterPostSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is ProductRegisterPostErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is ProductRegisterPutSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is ProductRegisterPutErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o produto. Tente novamente mais tarde.");
        } else if (state is ProductRegisterGetErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is ProductRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        } else if (state is ProductRegisterInfoPageState) {
          return const ProductRegisterInterationPage();
        }
        final prices = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const AutoSizeText(
              'Lista de Produtos',
              style: kTitleAppBarStyle,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add, color: kSecondaryColor),
                onPressed: () {
                  bloc.add(ProductRegisterAddEvent());
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
                                bloc.model.product = prices[index];
                                bloc.add(ProductRegisterEditEvent());
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: (Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(
                                      prices[index].id.toString(),
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
          bloc.add(ProductRegisterSearchEvent(search: value));
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
