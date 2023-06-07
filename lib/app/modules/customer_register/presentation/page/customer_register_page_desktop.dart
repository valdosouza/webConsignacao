import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/customer_register_module.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:appweb/app/modules/customer_register/presentation/content/content_customer_register.dart';
import 'package:appweb/app/modules/customer_register/presentation/content/content_customer_register_desktop.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_city_list_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_region_list_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_sales_route_list_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_state_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterPageDesktop extends StatefulWidget {
  final int tbCustomerId;
  const CustomerRegisterPageDesktop({
    Key? key,
    required this.tbCustomerId,
  }) : super(key: key);

  @override
  State<CustomerRegisterPageDesktop> createState() =>
      _CustomerRegisterPageDesktopState();
}

class _CustomerRegisterPageDesktopState
    extends State<CustomerRegisterPageDesktop> {
  late final CustomerRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CustomerRegisterModule>();
    });
    bloc = Modular.get<CustomerRegisterBloc>();
    bloc.add(CustomerRegisterGetListEvent());
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
            child: CustomCircularProgressIndicator(),
          );
        }

        if (state is CustomerRegisterGetStatesSuccessState) {
          return const CustomerRegisterStateListWidget();
        }

        if (state is CustomerRegisterGetCitySuccessState) {
          return const CustomerRegisterCityListWidget();
        }

        if (state is CustomerRegisterGetRegionSuccessState) {
          return const CustomerRegisterRegionListWidget();
        }

        if (state is CustomerRegisterGetSalesRouteSuccessState) {
          return const CustomerRegisterSalesRouteListWidget();
        }

        if (state is CustomerRegisterInfoPageState) {
          return ContentCustomerRegisterDesktop(
            customer: state.model,
            tabIndex: state.tabIndex,
          );
        }

        final customers = state.customers;
        return _listaCustomer(customers);
      },
    );
  }

  _listaCustomer(List<CustomerListModel> customers) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              bloc.customer = CustomerMainModel.empty();
              bloc.add(CustomerRegisterDesktopEvent());
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
              buildSearchInput(bloc),
              const SizedBox(height: 30.0),
              buildListView(bloc, customers),
            ],
          ),
        ),
      ),
    );
  }
}
