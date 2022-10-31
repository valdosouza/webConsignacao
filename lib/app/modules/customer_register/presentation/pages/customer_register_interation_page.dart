import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_event.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_state.dart';
import 'package:appweb/app/modules/customer_register/presentation/widgets/customer_register_address_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widgets/customer_register_identification_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widgets/customer_register_others_widget.dart';
import 'package:appweb/app/modules/customer_register/presentation/widgets/customer_register_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRegisterInterationPage extends StatefulWidget {
  final CustomerMainModel customer;
  final int tabIndex;
  const CustomerRegisterInterationPage({
    Key? key,
    required this.customer,
    required this.tabIndex,
  }) : super(key: key);

  @override
  State<CustomerRegisterInterationPage> createState() =>
      _CustomerRegisterInterationPageState();
}

class _CustomerRegisterInterationPageState
    extends State<CustomerRegisterInterationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late CustomerMainModel customer;

  late final CustomerRegisterBloc bloc;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Dados Principais'),
    const Tab(text: 'Endereço'),
    const Tab(text: 'Telefone'),
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
    return WillPopScope(
      onWillPop: () async {
        bloc.add(CustomerRegisterGetListEvent());
        return true;
      },
      child: BlocConsumer<CustomerRegisterBloc, CustomerRegisterState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CustomerRegisterCnpjErrorState) {
            CustomToast.showToast(
                "Ocorreu um erro ao buscar por cnpj. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(CustomerRegisterGetListEvent());
                },
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromARGB(255, 229, 57, 57),
                        Color.fromARGB(255, 224, 71, 71),
                        Color.fromARGB(255, 241, 97, 97),
                      ]),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    customer.customer.id != 0
                        ? "Editar Cliente"
                        : "Adicionar Cliente",
                    style: kHintTextStyle.copyWith(fontSize: 32.0),
                  ),
                  const SizedBox(width: 100.0),
                  IconButton(
                    onPressed: () {
                      bloc.add(CustomerRegisterPostEvent(model: bloc.customer));
                    },
                    hoverColor: Colors.transparent,
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorWeight: 2.0,
                indicatorColor: Colors.black,
                tabs: myTabs,
              ),
            ),
            body: TabBarView(
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
                CustomerRegisterOthersWidget(
                  bloc: bloc,
                  customer: customer,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
