import 'package:appweb/app/modules/cashier_closure/data/datasource/cashier_closure_datasource.dart';
import 'package:appweb/app/modules/cashier_closure/data/repository/cashier_closure_repository_impl.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_previously.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_today.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/page/cashier_closure_page.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/page/closure/cashier_closure_by_day_page_mobile.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/page/closure/cashier_closure_previously_page_mobile.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/page/closure/cashier_closure_today_page_mobile.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/page/closure/cashier_closure_yesterday_page_mobile.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/bloc/cashier_closure_bloc.dart';
import 'package:http/http.dart' as http;

class CashierClosureModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CashierClosureDatasource>(
          (i) => CashierClosureDatasourceImpl(
            httpClient: http.Client(),
          ),
        ),
        Bind.factory(
          (i) => CashierClosureRepositoryImpl(
              datasource: i.get<CashierClosureDatasource>()),
        ),
        Bind.factory(
          (i) => CashierClosureGet(
              repository: i.get<CashierClosureRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CashierClosureGetPreviously(
              repository: i.get<CashierClosureRepositoryImpl>()),
        ),
        Bind.singleton(
          (i) => CashierClosureBloc(
            cashierClosureGet: i.get<CashierClosureGet>(),
            cashierClosureGetPreviously: i.get<CashierClosureGetPreviously>(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const CashierClosurePage(),
    ),
    ChildRoute(
      '/mobile/today/',
      child: (_, args) => const CashierClosureTodayPageMobile(),
    ),
    ChildRoute(
      '/mobile/yesterday/',
      child: (_, args) => const CashierClosureYesterdayPageMobile(),
    ),
    ChildRoute(
      '/mobile/allpreviously/',
      child: (_, args) => const CashierClosurePreviouslyPageMobile(),
    ),
    ChildRoute(
      '/mobile/byday/',
      child: (_, args) =>
          CashierClosureByDayPageMobile(dateSelected: args.data),
    ),
  ];
}
