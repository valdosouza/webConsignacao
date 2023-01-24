import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/attendance_by_customer/attendance_by_customer_module.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_bloc.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/content/customer_list_mobile.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_event.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceByCustomerPageMobile extends StatefulWidget {
  const AttendanceByCustomerPageMobile({super.key});

  @override
  State<AttendanceByCustomerPageMobile> createState() =>
      AttendanceByCustomerPageMobileState();
}

class AttendanceByCustomerPageMobileState
    extends State<AttendanceByCustomerPageMobile> {
  late final AttendanceByCustomerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceByCustomerBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceByCustomerModule>();
    });
    bloc.add(CustomerGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceByCustomerBloc, AttendanceByCustomerState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CustomerListErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is CustomerListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CustomerListLoadedState) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: kBoxDecorationflexibleSpace,
              ),
              title: const Text('Lista de Clientes'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Modular.to.navigate('/customer/mobile/');
                },
              ),
            ),
            body: CustomerListMobile(lista: state.customerList),
          );
        }
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                //Modular.to.pop();
                //Navigator.of(context).pop();
                Modular.to.navigate('/customer/mobile/');
              },
            ),
            title: const Text('Erro'),
          ),
          body: const Center(child: Text("Estado não encontrado")),
        );
      },
    );
  }
}
