import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopOrderProductionRegister extends StatefulWidget {
  const ContentDesktopOrderProductionRegister({super.key});

  @override
  State<ContentDesktopOrderProductionRegister> createState() =>
      _ContentDesktopOrderProductionRegisterState();
}

class _ContentDesktopOrderProductionRegisterState
    extends State<ContentDesktopOrderProductionRegister> {
  late final OrderProductionRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<OrderProductionRegisterBloc>();
    bloc.add(OrderProductionRegisterGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderProductionRegisterBloc,
        OrderProductionRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is OrderProductionRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar a lista. Tente novamente mais tarde.");
        } else if (state is OrderProductionRegisterPostSuccessState) {
          CustomToast.showToast("Produto adicionado com sucesso.");
        } else if (state is OrderProductionRegisterPostErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar produto. Tente novamente mais tarde.");
        } else if (state is OrderProductionRegisterPutSuccessState) {
          CustomToast.showToast("Produto editado com sucesso.");
        } else if (state is OrderProductionRegisterPutErrorState) {
          CustomToast.showToast(
              "Erro ao editar o produto. Tente novamente mais tarde.");
        } else if (state is OrderProductionRegisterGetErrorState) {
          CustomToast.showToast(
              "Erro ao buscar o produto. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is OrderProductionRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // else if (state is OrderProductionRegisterInfoPageState) {
        //   return ProductRegisterInterationPage(
        //     product: state.model!,
        //     index: state.list.last.id,
        //   );
        // }
        final orders = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Produtos'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  // bloc.add(OrderProductionRegisterInfoEvent());
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
                    child: orders.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum dado em nossa base."))
                        : ListView.separated(
                            itemCount: orders.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                // bloc.add(OrderProductionRegisterInfoEvent(
                                //     model: orders[index]));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(orders[index].id.toString()),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(orders[index].nameMerchandise),
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
          bloc.add(OrderProductionRegisterSearchEvent(search: value));
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
