import 'package:appweb/app/modules/price_list_register/data/datasource/price_list_register_datasource.dart';
import 'package:appweb/app/modules/price_list_register/data/repository/price_list_register_repository_impl.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_delete.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_put.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_get_list.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_post.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_bloc.dart';
import 'package:appweb/app/modules/price_list_register/presentation/page/price_list_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class PriceListRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<PriceListRegisterDataSource>(
          (i) => PriceListRegisterDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => PriceListRegisterRepositoryImpl(
              datasource: i.get<PriceListRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => PriceListRegisterGetlist(
              repository: i.get<PriceListRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => PriceListRegisterPost(
              repository: i.get<PriceListRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => PriceListRegisterPut(
              repository: i.get<PriceListRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => PriceListRegisterDelete(
              repository: i.get<PriceListRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => PriceListRegisterBloc(
              getlist: i.get<PriceListRegisterGetlist>(),
              post: i.get<PriceListRegisterPost>(),
              put: i.get<PriceListRegisterPut>(),
              delete: i.get<PriceListRegisterDelete>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PriceListRegister()),
  ];
}
