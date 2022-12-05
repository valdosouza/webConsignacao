import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:flutter/material.dart';

statesCustomer(CustomerRegisterState state) {
  if (state is CustomerRegisterErrorState) {
    CustomToast.showToast(
        "Erro ao buscar os clientes. Tente novamente mais tarde");
  } else if (state is CustomerRegisterCnpjErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao buscar por cnpj. Tente novamente mais tarde.");
  } else if (state is CustomerRegisterPostSuccessState) {
    CustomToast.showToast("Cliente adicionado com sucesso.");
  } else if (state is CustomerRegisterPutSuccessState) {
    CustomToast.showToast("Cliente editado com sucesso.");
  } else if (state is CustomerRegisterPostErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao adicionar o cliente. Tente novamente mais tarde.");
  } else if (state is CustomerRegisterPutErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao editar o cliente. Tente novamente mais tarde.");
  } else if (state is CustomerRegisterGetErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao buscar os dados do cliente. Tente novamente mais tarde.");
  }
}

buildSearchInput(CustomerRegisterBloc bloc) {
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

buildListView(CustomerRegisterBloc bloc, List<CustomerListModel> customers) {
  return Expanded(
    child: customers.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: customers.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                bloc.add(CustomerRegisterDesktopEvent(id: customers[index].id));
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
                    Text("Nome: ${customers[index].nameCompany}"),
                    const SizedBox(height: 5.0),
                    customers[index].docType == "J"
                        ? Text("CNPJ: ${customers[index].documento}")
                        : Text("CPF: ${customers[index].documento}"),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    CustomToast.showToast("Funcionalidade em desenvolvimento.");
                  },
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
  );
}
