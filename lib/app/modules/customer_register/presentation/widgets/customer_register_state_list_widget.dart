import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterStateListWidget extends StatefulWidget {
  const CustomerRegisterStateListWidget({
    super.key,
  });

  @override
  State<CustomerRegisterStateListWidget> createState() =>
      CustomerRegisterStateListWidgetState();
}

class CustomerRegisterStateListWidgetState
    extends State<CustomerRegisterStateListWidget> {
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
        if (state is CustomerRegisterGetStatesSuccessState) {
          return _customerStateList(state);
        } else {
          return Container();
        }
      },
    );
  }

  _customerStateList(CustomerRegisterGetStatesSuccessState state) {
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
                    bloc.add(CustomerRegisterSearchStateEvent(search: value));
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
                            bloc.add(CustomerRegisterReturnEvent(index: 1));
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
  }
}
