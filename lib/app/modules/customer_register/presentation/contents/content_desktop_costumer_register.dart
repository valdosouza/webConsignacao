import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
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
        }
      },
      builder: (context, state) {
        if (state is CustomerRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final customers = state.customers;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Clientes'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {},
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
                              onTap: () {},
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
                                        "Nome: ${customers[index].entity.nameCompany}"),
                                    const SizedBox(height: 5.0),
                                    Text(
                                        "CNPJ: ${customers[index].company.cnpj}"),
                                    const SizedBox(height: 5.0),
                                    Text("CPF: ${customers[index].person.cpf}"),
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
