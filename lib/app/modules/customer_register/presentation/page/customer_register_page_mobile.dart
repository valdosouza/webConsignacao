import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/customer_register/customer_register_module.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:appweb/app/modules/customer_register/presentation/content/content_customer_register.dart';
import 'package:appweb/app/modules/customer_register/presentation/content/content_customer_register_mobile.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_city_list_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_sales_route_list_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_salesman_list_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_state_list_widget.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterPageMobile extends StatefulWidget {
  final int tbCustomerId;
  const CustomerRegisterPageMobile({
    super.key,
    required this.tbCustomerId,
  });

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
    if (widget.tbCustomerId == 0) {
      bloc.add(CustomerRegisterMobileNewEvent());
    } else {
      bloc.add(
          CustomerRegisterMobileEditEvent(tbCustomerId: widget.tbCustomerId));
    }
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

        if (state is CustomerRegisterGetSalesmanSuccessState) {
          return const CustomerRegisterSalesmanListWidget();
        }

        if (state is CustomerRegisterGetSalesRouteSuccessState) {
          return const CustomerRegisterSalesRouteListWidget();
        }
        if (state is CustomerRegisterPostByMobileSuccessState) {
          OrderAttendanceModel orderAttemdance = OrderAttendanceModel(
            id: 0,
            tbInstitutionId: 0,
            tbUserId: 0,
            dtRecord: CustomDate.newDate(),
            tbCustomerId: state.customer.id,
            nameCustomer: state.customer.nickTrade,
            tbSalesmanId: 0,
            nameSalesman: "",
            tbPriceListId: 0,
            note: "",
            status: "A",
            visited: "S",
            charged: "N",
            recall: "N",
            finished: "N",
            longitude: "",
            latitude: "",
            routeRetorn: '/attendancecustomer/mobile/',
          );
          Modular.to.navigate(
            '/attendance/',
            arguments: orderAttemdance,
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
