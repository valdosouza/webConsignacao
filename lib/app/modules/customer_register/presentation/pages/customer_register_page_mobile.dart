import 'package:appweb/app/modules/customer_register/customer_register_module.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_customer_register.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_customer_register_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterPageMobile extends StatefulWidget {
  const CustomerRegisterPageMobile({super.key});

  @override
  State<CustomerRegisterPageMobile> createState() =>
      _CustomerRegisterPageMobileState();
}

class _CustomerRegisterPageMobileState
    extends State<CustomerRegisterPageMobile> {
  late final CustomerRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CustomerRegisterModule>();
    });
    bloc = Modular.get<CustomerRegisterBloc>();
    bloc.customer = CustomerMainModel.empty();
    bloc.add(CustomerRegisterMobileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerRegisterBloc, CustomerRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesCustomer(state);
      },
      builder: (context, state) {
        if (state is CustomerRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CustomerRegisterInfoPageState) {
          return ContentCustomerRegisterMobile(
            customer: state.model,
            tabIndex: state.tabIndex,
          );
        }

        return Container();
      },
    );
  }
}
