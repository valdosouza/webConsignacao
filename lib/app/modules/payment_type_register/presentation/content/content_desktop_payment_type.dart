import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/pages/payment_type_interaction_page.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_events.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopPaymentType extends StatefulWidget {
  const ContentDesktopPaymentType({super.key});

  @override
  State<ContentDesktopPaymentType> createState() =>
      _ContentDesktopPaymentTypeState();
}

class _ContentDesktopPaymentTypeState extends State<ContentDesktopPaymentType> {
  late PaymentTypeBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<PaymentTypeBloc>();
    bloc.add(LoadPaymentTypeEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentTypeBloc, PaymentTypeState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is PaymentTypeDeleteSuccessState) {
          CustomToast.showToast("Forma de pagamento removido com sucesso.");
        } else if (state is PaymentTypeDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover forma de pagamento. Tente novamente mais tarde.");
        } else if (state is PaymentTypeAddSuccessState) {
          CustomToast.showToast("Forma de pagamento adicionado com sucesso");
          bloc.add(LoadPaymentTypeEvent());
        } else if (state is PaymentTypeAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar forma de pagamento. Tente novamente mais tarde.");
        } else if (state is PaymentTypeEditSuccessState) {
          CustomToast.showToast("Forma de pagamento editado com sucesso");
          bloc.add(LoadPaymentTypeEvent());
        } else if (state is PaymentTypePutErrorState) {
          CustomToast.showToast(
              "Erro ao editar forma de pagamento. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is PaymentTypeInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PaymentTypeInterationPageState) {
          return PaymentTypeInteractionPage(
            bloc: bloc,
            paymentType: state.paymentType,
          );
        }
        final paymentTypeList = state.paymentTypeList;

        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const Text('Lista de Formas de Pagamento'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(PaymentTypeInterationEvent());
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
                    child: paymentTypeList.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum regsitro em nossa base."))
                        : ListView.separated(
                            itemCount: paymentTypeList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => bloc.add(PaymentTypeInterationEvent(
                                  paymentType: paymentTypeList[index])),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(
                                        paymentTypeList[index].id.toString()),
                                  ),
                                ),
                                title: Text(paymentTypeList[index].description),
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
          bloc.add(SearchPaymentTypeEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise as formas de pagamento",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
