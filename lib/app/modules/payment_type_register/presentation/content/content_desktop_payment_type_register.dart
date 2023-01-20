import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_event.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_state.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/page/payment_type_register_interation_page.dart';
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
    super.initState();
    bloc = Modular.get<PaymentTypeRegisterBloc>();
    bloc.add(PaymentTypeRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentTypeRegisterBloc, PaymentTypeRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is PaymentTypeRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        } else if (state is PaymentTypeRegisterAddSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is PaymentTypeRegisterAddErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        } else if (state is PaymentTypeRegisterEditSuccessState) {
          CustomToast.showToast("Cadastro atualizado com sucesso.");
        } else if (state is PaymentTypeRegisterEditErrorState) {
          CustomToast.showToast(
              "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is PaymentTypeRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PaymentTypeRegisterInfoPageState) {
          return const PaymentTypeRegisterInterationPage();
        }
        final paymentsType = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de forma de pagamentos'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(PaymentTypeRegisterAddEvent());
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
                    child: paymentsType.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum registro em nossa base."))
                        : ListView.separated(
                            itemCount: paymentsType.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.model = paymentsType[index];
                                bloc.add(PaymentTypeRegisterEditEvent());
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
                                    Text(paymentsType[index].description),
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
