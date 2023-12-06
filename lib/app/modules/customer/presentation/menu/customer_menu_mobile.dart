import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:appweb/app/modules/customer/customer_module.dart';
import 'package:appweb/app/modules/customer/presentation/bloc/customer_bloc.dart';
import 'package:appweb/app/modules/customer/presentation/bloc/customer_event.dart';
import 'package:appweb/app/modules/customer/presentation/bloc/customer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerMenuMobile extends StatefulWidget {
  const CustomerMenuMobile({super.key});

  @override
  State<CustomerMenuMobile> createState() => _CustomerMenuMobileState();
}

class _CustomerMenuMobileState extends State<CustomerMenuMobile> {
  late final CustomerBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CustomerModule>();
    });
    bloc = Modular.get<CustomerBloc>();
    bloc.add(CustomerGetRegionListEvent());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<CustomerBloc, CustomerState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CustomerGetRegionListErrorState) {
          CustomToast.showToast(state.error);
        }
      },
      builder: (context, state) {
        if (state is CustomerLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        if (state is CustomerGetRegionListLoadedState) {
          return SizedBox(
            height: size.height,
            child: Column(
              children: [
                itemMenuDraw(
                  Icons.home,
                  'Lista',
                  () async =>
                      Modular.to.navigate('/attendancecustomer/mobile/'),
                ),
                itemMenuDraw(
                  Icons.home,
                  'Novo',
                  () async => Modular.to
                      .navigate('/customer/mobile/register/customer-register/'),
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
                  decoration: kBoxDecorationflexibleSpace,
                  child: const SizedBox(
                    child: Text(
                      "Clientes por Região",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height - 237,
                  child: ListView.builder(
                    itemCount: bloc.regionList.length,
                    itemBuilder: (context, index) {
                      return itemMenuDraw(
                        Icons.home,
                        bloc.regionList[index].description,
                        () async {
                          Modular.to.navigate(
                            '/attendancesalesroute/mobile/',
                            arguments: [
                              0,
                              "",
                              bloc.regionList[index].id,
                              bloc.regionList[index].description,
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return _menuFixo();
      },
    );
  }

  _menuFixo() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(
            Icons.home,
            'Lista',
            () async => Modular.to.navigate('/attendancecustomer/mobile/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Novo',
            () async => Modular.to
                .navigate('/customer/mobile/register/customer-register/'),
          ),
        ],
      ),
    );
  }
}
