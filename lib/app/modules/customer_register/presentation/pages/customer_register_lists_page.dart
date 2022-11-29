import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterListsPage extends StatefulWidget {
  const CustomerRegisterListsPage({
    super.key,
  });

  @override
  State<CustomerRegisterListsPage> createState() =>
      _CustomerRegisterListsPageState();
}

class _CustomerRegisterListsPageState extends State<CustomerRegisterListsPage> {
  late final CustomerRegisterBloc bloc;

  @override
  void initState() {
    bloc = Modular.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerRegisterBloc, CustomerRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CustomerRegisterGetStatesSuccessState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de estados'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CustomerRegisterReturnEvent(index: 1));
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        onChanged: (value) {
                          bloc.add(
                              CustomerRegisterSearchStateEvent(search: value));
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 4.0),
                          hintText: "Pesquise aqui",
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Expanded(
                      child: state.states.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhum estado em nossa base."))
                          : ListView.separated(
                              itemCount: state.states.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.customer.address.tbStateId =
                                      state.states[index].id;
                                  bloc.customer.address.stateName =
                                      state.states[index].name;
                                  bloc.add(
                                      CustomerRegisterReturnEvent(index: 1));
                                },
                                child: ListTile(
                                  leading: Text(
                                      "${state.states[index].name} - ${state.states[index].abbreviation}"),
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
        } else if (state is CustomerRegisterGetCitySuccessState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de cidades'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CustomerRegisterReturnEvent(index: 1));
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        onChanged: (value) {
                          bloc.add(
                              CustomerRegisterSearchCityEvent(search: value));
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5.0),
                          hintText: "Pesquise aqui",
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Expanded(
                      child: state.cities.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhuma cidade em nossa base."))
                          : ListView.separated(
                              itemCount: state.cities.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.customer.address.tbCityId =
                                      state.cities[index].id;
                                  bloc.customer.address.cityName =
                                      state.cities[index].name;
                                  bloc.add(
                                      CustomerRegisterReturnEvent(index: 1));
                                },
                                child: ListTile(
                                  leading: Text(state.cities[index].name),
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
        } else if (state is CustomerRegisterGetSalesmanSuccessState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de vendedores'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CustomerRegisterReturnEvent(index: 3));
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        onChanged: (value) {
                          bloc.add(CustomerRegisterSearchSalesmanEvent(
                              search: value));
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5.0),
                          hintText: "Pesquise aqui",
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Expanded(
                      child: state.salesmans.isEmpty
                          ? const Center(
                              child: Text(
                                  "Não encontramos nenhum vendedor em nossa base."))
                          : ListView.separated(
                              itemCount: state.salesmans.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  bloc.customer.customer.tbSalesmanId =
                                      state.salesmans[index].id;
                                  bloc.customer.customer.salesmanName =
                                      state.salesmans[index].nameCompany;
                                  bloc.add(
                                      CustomerRegisterReturnEvent(index: 3));
                                },
                                child: ListTile(
                                  leading:
                                      Text(state.salesmans[index].nameCompany),
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
        } else {
          return Container();
        }
      },
    );
  }
}
