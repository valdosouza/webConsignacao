import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_events.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_states.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/pages/payment_type_interaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopPaymentTypeRegister extends StatefulWidget {
  const ContentDesktopPaymentTypeRegister({super.key});

  @override
  State<ContentDesktopPaymentTypeRegister> createState() =>
      _ContentDesktopPaymentTypeRegisterState();
}

class _ContentDesktopPaymentTypeRegisterState
    extends State<ContentDesktopPaymentTypeRegister> {
  late final PaymentTypeRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<PaymentTypeRegisterBloc>();
    bloc.add(PaymentTypeRegisterGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentTypeRegisterBloc, PaymentTypeRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is PaymentTypeRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar a lista. Tente novamente mais tarde.");
        } else if (state is PaymentTypeRegisterAddSuccessState) {
          CustomToast.showToast("Forma de Pagamento adicionado com sucesso.");
        } else if (state is PaymentTypeRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar Forma de Pagamento. Tente novamente mais tarde.");
        } else if (state is PaymentTypeRegisterEditSuccessState) {
          CustomToast.showToast("Forma de Pagamento editado com sucesso.");
        } else if (state is PaymentTypeRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao editar Forma de Pagamento. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is PaymentTypeRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PaymentTypeRegisterInfoPageState) {
          return PaymentTypeRegisterInterationPage(
            model: state.model,
            index: state.list.last.id,
          );
        }
        final prices = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Formas de Pagamentos'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(PaymentTypeRegisterInfoEvent());
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
                                bloc.add(PaymentTypeRegisterInfoEvent(
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
          bloc.add(PaymentTypeRegisterSearchEvent(search: value));
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
