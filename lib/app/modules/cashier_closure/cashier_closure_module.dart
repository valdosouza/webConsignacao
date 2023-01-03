import 'package:appweb/app/modules/cashier_closure/presentation/pages/cashier_closure_page.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/pages/closure/cashier_closure_previously_page_mobile.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/pages/closure/cashier_closure_today_page_mobile.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/pages/closure/cashier_closure_yesterday_page_mobile.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierClosureModule extends Module {
  @override
  List<Bind> get binds => [];
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
    )
  ];
}
