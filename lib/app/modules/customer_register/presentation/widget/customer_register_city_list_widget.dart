import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterCityListWidget extends StatefulWidget {
  const CustomerRegisterCityListWidget({
    super.key,
  });

  @override
  State<CustomerRegisterCityListWidget> createState() =>
      CustomerRegisterCityListWidgetState();
}

class CustomerRegisterCityListWidgetState
    extends State<CustomerRegisterCityListWidget> {
  late final CustomerRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CustomerRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerRegisterBloc, CustomerRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CustomerRegisterGetCitySuccessState) {
          return _customerCityList(state);
        } else {
          return Container();
        }
      },
    );
  }

  Scaffold _customerCityList(CustomerRegisterGetCitySuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          'Lista de cidades',
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
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
                    bloc.add(CustomerRegisterSearchCityEvent(search: value));
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
                            "Não encontramos nenhum registro em nossa base."))
                    : ListView.separated(
                        itemCount: state.cities.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            bloc.customer.address.tbCityId =
                                state.cities[index].id;
                            bloc.customer.address.cityName =
                                state.cities[index].name;
                            bloc.add(CustomerRegisterReturnEvent(index: 1));
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
  }
}
