import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/custom_imput_button.dart';
import 'package:appweb/app/modules/attendance_ordering/attendance_ordering_module.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/event.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/state.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/content/customer_list_content.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/page/desktop/region_list_desktop.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/page/desktop/route_list_desktop.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => DesktopState();
}

class DesktopState extends State<Desktop> {
  late AttendanceOrderingBloc bloc;
  String titleName = "Ordenação de Atendimento";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceOrderingModule>();
    });
    bloc = Modular.get<AttendanceOrderingBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: AutoSizeText(
            titleName,
            style: kTitleAppBarStyle,
          ),
        ),
        body: BlocConsumer<AttendanceOrderingBloc, AttendanceOrderingState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is ErrorState) {
              CustomToast.showToast(state.msg);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const CustomCircularProgressIndicator();
            }
            if (state is RegionLoadedState) {
              return const RegionListDesktop();
            }
            if (state is RouteLoadedState) {
              return const RouteListDesktop();
            }
            return SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  search(),
                  title(),
                  const CustomerListContent(),
                ],
              ),
            );
          },
        ));
  }

  search() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            flex: 200,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInputButton(
                initialValue: bloc.nameRegion,
                readOnly: true,
                enabled: true,
                title: "Nome da Região",
                onAction: () => bloc.add(GetRegionListEvent()),
              ),
            ),
          ),
          Expanded(
            flex: 200,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInputButton(
                initialValue: bloc.nameSalesRoute,
                readOnly: true,
                enabled: true,
                title: "Rota",
                onAction: () => bloc.add(GetRouteListEvent()),
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 3.0, top: 30, right: 10, bottom: 3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(20, 50),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  bloc.tbCustomerIdPickedForOrder = -1;
                  bloc.add(GetCustomerListEvent(
                      params: ParamsGetCustomer(
                          tbRegionId: bloc.tbRegionId,
                          tbSalesRouteId: bloc.tbSalesRouteId)));
                },
                child: const Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Icon(Icons.manage_search_sharp, color: kSecondaryColor),
                    Text(
                      "Atualizar",
                      style: kElevatedButtonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 90,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 3.0, top: 30, right: 10, bottom: 3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(30, 50),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  bloc.tbCustomerIdPickedForOrder = -1;
                  bloc.add(
                    ApplyDefaultSequenceEvent(
                      params: ParamsApplyDefaultSequence(
                        tbInstitutionId: 0,
                        tbSalesRouteId: bloc.tbSalesRouteId,
                        tbRegionId: bloc.tbRegionId,
                      ),
                    ),
                  );
                },
                child: const Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Icon(Icons.ads_click_sharp, color: kSecondaryColor),
                    Text(
                      "Aplicar Padrão",
                      style: kElevatedButtonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  title() {
    return Container(
      height: 50,
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Seq. Padrão",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "Dados do Cliente",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Sequencia Vendedor",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Alterar Sequência",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
