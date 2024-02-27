import 'package:appweb/app/modules/sales_average/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/sales_average/presentation/bloc/event.dart';
import 'package:appweb/app/modules/sales_average/presentation/content/region_list_content.dart';
import 'package:appweb/app/modules/sales_average/sales_average_module.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class RegionListDesktop extends StatefulWidget {
  const RegionListDesktop({
    super.key,
  });

  @override
  State<RegionListDesktop> createState() => RegionListDesktopState();
}

class RegionListDesktopState extends State<RegionListDesktop> {
  late SalesAverageBloc bloc;

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
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          "Lista de Regiões",
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            bloc.nameRegion = "";
            bloc.tbRegionId = 0;
            bloc.add(MainFormEvent());
          },
        ),
      ),
      body: RegionListContent(list: bloc.regionList),
    );
  }
}
