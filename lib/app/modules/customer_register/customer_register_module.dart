import 'package:appweb/app/modules/customer_register/data/datasource/customer_register_datasource.dart';
import 'package:appweb/app/modules/customer_register/data/repository/customer_register_repository.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_cep_usecase.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_citys.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_cnpj.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_list.dart';
import 'package:appweb/app/modules/customer_register/domain/usecase/customer_register_get_states.dart';
import 'package:appweb/app/modules/customer_register/presentation/bloc/customer_register_bloc.dart';
import 'package:appweb/app/modules/customer_register/presentation/pages/customer_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class CustomerRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CustomerRegisterDataSource>(
          (i) => CustomerRegisterDataSourceImpl(),
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
          (i) => CustomerRegisterGetCep(
              repository: i.get<CustomerRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CustomerRegisterGetCity(
              repository: i.get<CustomerRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CustomerRegisterGetCnpj(
              repository: i.get<CustomerRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CustomerRegisterGetStates(
              repository: i.get<CustomerRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => CustomerRegisterBloc(
              getlist: i.get<CustomerRegisterGetlist>(),
              getCep: i.get<CustomerRegisterGetCep>(),
              getCity: i.get<CustomerRegisterGetCity>(),
              getCnpj: i.get<CustomerRegisterGetCnpj>(),
              getStates: i.get<CustomerRegisterGetStates>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ContentCustomerRegister()),
  ];
}
