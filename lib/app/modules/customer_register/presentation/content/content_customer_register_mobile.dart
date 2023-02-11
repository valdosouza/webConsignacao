import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_address_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_identification_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_others_mobile_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widget/customer_register_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentCustomerRegisterMobile extends StatefulWidget {
  final CustomerMainModel customer;
  final int tabIndex;
  const ContentCustomerRegisterMobile({
    Key? key,
    required this.customer,
    required this.tabIndex,
  }) : super(key: key);

  @override
  State<ContentCustomerRegisterMobile> createState() =>
      _ContentCustomerRegisterMobileState();
}

class _ContentCustomerRegisterMobileState
    extends State<ContentCustomerRegisterMobile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late CustomerMainModel customer;

  late final CustomerRegisterBloc bloc;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Principal'),
    const Tab(text: 'Endereço'),
    const Tab(text: 'Fone'),
    const Tab(text: 'Outros'),
  ];

  @override
  void initState() {
    super.initState();
    bloc = Modular.get();
    customer = widget.customer;
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.animateTo(widget.tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Modular.to.navigate('/customer/mobile/');
        return true;
      },
      child: BlocConsumer<CustomerRegisterBloc, CustomerRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CustomerRegisterCnpjErrorState) {
            CustomToast.showToast(
                "Erro ao buscar os dados. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Modular.to.navigate('/customer/mobile/');
                },
              ),
              title: Text(
                customer.customer.id != 0
                    ? "Editar Cliente"
                    : "Adicionar Cliente",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                  onPressed: () {
                    bloc.add(CustomerRegisterPostByMobileEvent(
                        model: bloc.customer));
                  },
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorWeight: 2.0,
                indicatorColor: Colors.black,
                tabs: myTabs,
              ),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: size.height - 150,
                width: size.width,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    CustomerRegisterIdentificationWidget(
                      bloc: bloc,
                      customer: customer,
                    ),
                    CustomerRegisterAddressWidget(
                      bloc: bloc,
                      customer: customer,
                    ),
                    CustomerRegisterPhoneWidget(
                      bloc: bloc,
                      customer: customer,
                    ),
                    CustomerRegisterOthersMobileWidget(
                      bloc: bloc,
                      customer: customer,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
