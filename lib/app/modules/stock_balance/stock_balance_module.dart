import 'package:appweb/app/modules/stock_balance/data/datasource/stock_balance_customer_datasource.dart';
import 'package:appweb/app/modules/stock_balance/data/datasource/stock_balance_datasource.dart';
import 'package:appweb/app/modules/stock_balance/data/datasource/stock_balance_general_datasource.dart';
import 'package:appweb/app/modules/stock_balance/data/datasource/stock_balance_salesman_datasource.dart';
import 'package:appweb/app/modules/stock_balance/data/repository/stock_balance_customer_repository_impl.dart';
import 'package:appweb/app/modules/stock_balance/data/repository/stock_balance_general_repository_impl.dart';
import 'package:appweb/app/modules/stock_balance/data/repository/stock_balance_repository_impl.dart';
import 'package:appweb/app/modules/stock_balance/data/repository/stock_balance_salesman_repository_impl.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_customer_respository.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_general_respository.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_respository.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_salesman_respository.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/customer_all_by_products.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_customer_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_general_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_salesman_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/by_stock_list/stock_balance_stock_list.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/stock_balance_customer_page.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/stock_balance_general_page.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/stock_balance_salesman_page.dart';
import 'package:appweb/app/modules/stock_list_register/stock_list_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class StockBalanceModule extends Module {
  @override
  List<Module> get imports => [
        StockListRegisterModule(),
      ];

  @override
  List<Bind> get binds => [
        //------------------------Csutomer--------------------------------------
        Bind.factory(
          (i) => StockBalanceCustomerDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => StockBalanceCustomerRepositoryImpl(
              datasource: i.get<StockBalanceCustomerDataSource>()),
        ),
        Bind.factory(
          (i) => StockBalanceCustomerGetlist(
              repository: i.get<StockBalanceCustomerRepository>()),
        ),
        //------------------------Salesman--------------------------------------
        Bind.factory(
          (i) => StockBalanceSalesmanDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => StockBalanceSalesmanRepositoryImpl(
              datasource: i.get<StockBalanceSalesmanDataSource>()),
        ),
        Bind.factory(
          (i) => StockBalanceSalesmanGetlist(
              repository: i.get<StockBalanceSalesmanRepository>()),
        ),
        //------------------------General---------------------------------------
        Bind.factory(
          (i) => StockBalanceGeneralDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => StockBalanceGeneralRepositoryImpl(
              datasource: i.get<StockBalanceGeneralDataSource>()),
        ),
        Bind.factory(
          (i) => StockBalanceGeneralGetlist(
              repository: i.get<StockBalanceGeneralRepository>()),
        ),
        //------------------------StockList-------------------------------------
        Bind.factory(
          (i) => StockBalanceDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => StockBalanceRepositoryImpl(
              datasource: i.get<StockBalanceDataSource>()),
        ),
        Bind.factory(
          (i) => StockListGetlist(repository: i.get<StockBalanceRepository>()),
        ),
        //------------------------By StockList ---------------------------------
        Bind.factory(
          (i) =>
              StockBalanceGetlist(repository: i.get<StockBalanceRepository>()),
        ),
        //------------------------Customer By Product ---------------------------------
        Bind.factory(
          (i) => CustomerAllByProducts(
              repository: i.get<StockBalanceCustomerRepository>()),
        ),

        Bind.singleton((i) => StockBalanceBloc(
              customergetlist: i.get<StockBalanceCustomerGetlist>(),
              salesmangetlist: i.get<StockBalanceSalesmanGetlist>(),
              generalgetlist: i.get<StockBalanceGeneralGetlist>(),
              getlist: i.get<StockBalanceGetlist>(),
              stockListGetlist: i.get<StockListGetlist>(),
              customerAllByProducts: i.get<CustomerAllByProducts>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/customer/',
      child: (_, args) => const StockBalanceCustomerPage(),
      children: [
        ChildRoute(
          '/all/',
          child: (_, args) => const StockBalanceCustomerPage(),
        ),
      ],
    ),
    ChildRoute(
      '/salesman/',
      child: (_, args) => const StockBalanceSalesmanPage(),
      children: [
        ChildRoute(
          '/get/',
          child: (_, args) => const StockBalanceSalesmanPage(),
        ),
      ],
    ),
    ChildRoute(
      '/general/',
      child: (_, args) => const StockBalanceGeneralPage(),
      children: [
        ChildRoute(
          '/get/',
          child: (_, args) => const StockBalanceGeneralPage(),
        ),
      ],
    ),
    ChildRoute(
      '/bystocklist/',
      child: (_, args) => const StockBalanceStockList(),
    ),
  ];
}
