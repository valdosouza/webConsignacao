import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/custom_imput_button.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_sales_average.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/event.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/state.dart';
import 'package:appweb/app/modules/sales_average/presentation/content/sales_average_content.dart';
import 'package:appweb/app/modules/sales_average/presentation/page/desktop/region_list_desktop.dart';
import 'package:appweb/app/modules/sales_average/sales_average_module.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SalesAveragePageDesktop extends StatefulWidget {
  const SalesAveragePageDesktop({super.key});

  @override
  State<SalesAveragePageDesktop> createState() =>
      SalesAveragePageDesktopState();
}

class SalesAveragePageDesktopState extends State<SalesAveragePageDesktop> {
  late SalesAverageBloc bloc;
  String title = "Média de Vendas";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<SalesAverageModule>();
    });
    bloc = Modular.get<SalesAverageBloc>();
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
            title,
            style: kTitleAppBarStyle,
          ),
        ),
        body: BlocConsumer<SalesAverageBloc, SalesAverageState>(
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
            return SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  search(),
                  SalesAverageContent(list: bloc.salesAverageList),
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInput(
                initialValue: bloc.dateInitial,
                title: "Data Inicial",
                keyboardType: TextInputType.datetime,
                onChanged: (value) => bloc.dateInitial = value,
                inputAction: TextInputAction.next,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomInput(
                initialValue: bloc.dateFinal,
                title: "Data Final",
                keyboardType: TextInputType.datetime,
                onChanged: (value) => bloc.dateFinal = value,
                inputAction: TextInputAction.next,
              ),
            ),
          ),
          Expanded(
            flex: 2,
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 3.0, top: 30, right: 10, bottom: 3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(30, 50),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  bloc.add(
                    GetSalesAverageEvent(
                      params: ParamsGetSales(
                        tbInstitutionId: 0,
                        tbRegionId: bloc.tbRegionId,
                        dateInitial: bloc.dateInitial,
                        dateFinal: bloc.dateFinal,
                      ),
                    ),
                  );
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
        ],
      ),
    );
  }
}
