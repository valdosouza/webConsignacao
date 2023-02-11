import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cep.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_citys.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_cnpj.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_sales_route.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_salesman.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_states.dart';
import 'package:appweb/app/modules/customer_register/data/datasource/customer_register_datasource.dart';
import 'package:appweb/app/modules/customer_register/data/repository/customer_register_repository_impl.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_get.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_post.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_list.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/page/customer_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class CustomerRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<CustomerRegisterDataSource>(
          (i) => CustomerRegisterDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => CustomerRegisterRepositoryImpl(
              datasource: i.get<CustomerRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => CustomerRegisterGetlist(
              repository: i.get<CustomerRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CustomerRegisterGet(
              repository: i.get<CustomerRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CustomerRegisterPost(
              repository: i.get<CustomerRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => CustomerRegisterBloc(
              getlist: i.get<CustomerRegisterGetlist>(),
              getCep: i.get<GetCep>(),
              getCity: i.get<GetCities>(),
              getCnpj: i.get<GetCnpj>(),
              getStates: i.get<GetStates>(),
              getCustomer: i.get<CustomerRegisterGet>(),
              postCustomer: i.get<CustomerRegisterPost>(),
              getSalesmans: i.get<GetSalesman>(),
              getSalesRoute: i.get<GetSalesRoute>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => CustomerRegisterPage(tbCustomerId: args.data),
    ),
  ];
}
