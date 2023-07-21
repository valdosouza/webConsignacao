import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterRegionListWidget extends StatefulWidget {
  const CustomerRegisterRegionListWidget({
    super.key,
  });

  @override
  State<CustomerRegisterRegionListWidget> createState() =>
      _CustomerRegisterRegionListWidgetState();
}

class _CustomerRegisterRegionListWidgetState
    extends State<CustomerRegisterRegionListWidget> {
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
        if (state is CustomerRegisterGetRegionSuccessState) {
          return _customerRegionList(state);
        } else {
          return Container();
        }
      },
    );
  }

  _customerRegionList(CustomerRegisterGetRegionSuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de regiões'),
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
                    bloc.add(CustomerRegisterSearchRegionEvent(search: value));
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
                child: state.regions.isEmpty
                    ? const Center(
                        child: Text(
                            "Não encontramos nenhum registro em nossa base."))
                    : ListView.separated(
                        itemCount: state.regions.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            bloc.customer.customer.tbRegionId =
                                state.regions[index].id;
                            bloc.customer.customer.regionName =
                                state.regions[index].description;
                            bloc.add(CustomerRegisterReturnEvent(index: 3));
                          },
                          child: ListTile(
                            leading: Text(state.regions[index].description),
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
