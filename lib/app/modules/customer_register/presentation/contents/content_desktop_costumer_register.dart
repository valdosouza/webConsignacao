import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/customer_register_interation_page.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/customer_register_lists_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopCustomerRegister extends StatefulWidget {
  const ContentDesktopCustomerRegister({super.key});

  @override
  State<ContentDesktopCustomerRegister> createState() =>
      _ContentDesktopCustomerRegisterState();
}

class _ContentDesktopCustomerRegisterState
    extends State<ContentDesktopCustomerRegister> {
  late final CustomerRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get();
    bloc.add(CustomerRegisterGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerRegisterBloc, CustomerRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CustomerRegisterErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os clientes. Tente novamente mais tarde");
        } else if (state is CustomerRegisterCnpjErrorState) {
          CustomToast.showToast(
              "Ocorreu um erro ao buscar por cnpj. Tente novamente mais tarde.");
        } else if (state is CustomerRegisterPostAddSuccessState) {
          CustomToast.showToast("Cliente adicionado com sucesso.");
        } else if (state is CustomerRegisterPostEditSuccessState) {
          CustomToast.showToast("Cliente editado com sucesso.");
        } else if (state is CustomerRegisterPostAddErrorState) {
          CustomToast.showToast(
              "Ocorreu um erro ao adicionar o cliente. Tente novamente mais tarde.");
        } else if (state is CustomerRegisterPostEditErrorState) {
          CustomToast.showToast(
              "Ocorreu um erro ao editar o cliente. Tente novamente mais tarde.");
        } else if (state is CustomerRegisterGetErrorState) {
          CustomToast.showToast(
              "Ocorreu um erro ao buscar os dados do cliente. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is CustomerRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CustomerRegisterGetCitySuccessState ||
            state is CustomerRegisterGetStatesSuccessState ||
            state is CustomerRegisterGetSalesmanSuccessState) {
          return const CustomerRegisterListsPage();
        }

        if (state is CustomerRegisterInfoPageState) {
          return CustomerRegisterInterationPage(
            customer: state.model,
            tabIndex: state.tabIndex,
          );
        }
        final customers = state.customers;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Clientes'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.customer = CustomerMainModel.empty();
                  bloc.add(CustomerRegisterInfoEvent());
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
                    child: customers.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum registro em nossa base."))
                        : ListView.separated(
                            itemCount: customers.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.add(CustomerRegisterInfoEvent(
                                    id: customers[index].id));
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
                                    Text(
                                        "Nome: ${customers[index].nameCompany}"),
                                    const SizedBox(height: 5.0),
                                    customers[index].docType == "J"
                                        ? Text(
                                            "CNPJ: ${customers[index].documento}")
                                        : Text(
                                            "CPF: ${customers[index].documento}"),
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
          bloc.add(CustomerRegisterSearchEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise seu cliente por nome, cnpj ou cpf",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}