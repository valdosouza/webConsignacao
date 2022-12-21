import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/content/customer_list_mobile.dart';
import 'package:appweb/app/modules/attendance_by_salesman/attendance_by_salesman_module.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/bloc/attendance_by_salesman_bloc.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/bloc/attendance_by_salesman_event.dart';
import 'package:appweb/app/modules/attendance_by_salesman/presentation/bloc/attendance_by_salesman_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AttendanceBySalesmanPageMobile extends StatefulWidget {
  const AttendanceBySalesmanPageMobile({super.key});

  @override
  State<AttendanceBySalesmanPageMobile> createState() =>
      AttendanceBySalesmanPageMobileState();
}

class AttendanceBySalesmanPageMobileState
    extends State<AttendanceBySalesmanPageMobile> {
  late final AttendanceBySalesmanBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceBySalesmanBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceBySalesmanModule>();
    });
    bloc.add(CustomerGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceBySalesmanBloc, AttendanceBySalesmanState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CustomerListErrorState) {
          CustomToast.showToast(
              "Erro ao buscar a lista. Tente novamente mais tarde.");
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
