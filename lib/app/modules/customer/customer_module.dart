import 'package:appweb/app/modules/attendance_ordering/attendance_ordering_module.dart';
import 'package:appweb/app/modules/customer/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/customer/data/repository/customer_repository_impl.dart';
import 'package:appweb/app/modules/customer/domain/usecase/region_get_list.dart';
import 'package:appweb/app/modules/customer/presentation/bloc/customer_bloc.dart';
import 'package:appweb/app/modules/customer/presentation/page/customer_page.dart';
import 'package:appweb/app/modules/customer/presentation/page/customer_page_mobile.dart';
import 'package:appweb/app/modules/customer_register/customer_register_module.dart';
import 'package:appweb/app/modules/customer_register/presentation/page/customer_register_page_mobile.dart';
import 'package:appweb/app/modules/order_bonus_register/order_bonus_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class CustomerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CustomerDataSource>(
          (i) => CustomerDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) =>
              CustomerRepositoryImpl(datasource: i.get<CustomerDataSource>()),
        ),
        Bind.factory(
          (i) => RegionGetlist(repository: i.get<CustomerRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => CustomerBloc(
              regionGetlist: i.get<RegionGetlist>(),
            )),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/desktop/',
      child: (_, args) => const CustomerPage(),
      children: [
        ModuleRoute('/customer-register/', module: CustomerRegisterModule()),
        ModuleRoute('/orderbonus-register/',
            module: OrderBonusRegisterModule()),
        ModuleRoute('/attendance-ordering/',
            module: AttendanceOrderingModule()),
      ],
    ),
    ChildRoute(
      '/mobile/',
      child: (_, args) => const CustomerPageMobile(),
      children: [
        ModuleRoute('/customer-register/', module: CustomerRegisterModule()),
      ],
    ),
    ChildRoute(
      '/mobile/register/',
      child: (_, args) => const CustomerRegisterPageMobile(tbCustomerId: 0),
      children: [
        ModuleRoute('/customer-register/', module: CustomerRegisterModule()),
      ],
    ),
  ];
}
