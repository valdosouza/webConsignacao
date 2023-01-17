import 'package:appweb/app/modules/stock_list_register/data/datasource/remote/ownapi/stock_list_datasource.dart';
import 'package:appweb/app/modules/stock_list_register/data/repository/stock_list_repository_impl.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_post.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_delete.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_getlist.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_put.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_bloc.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/page/stock_list_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class StockListRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<StockListDatasource>(
          (i) => StockListDatasourceImpl(),
        ),
        Bind.factory(
          (i) => StockListRepositoryImpl(
              datasource: i.get<StockListDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => StockListRegisterGetlist(
              repository: i.get<StockListRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListRegisterDelete(
              repository: i.get<StockListRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListRegisterPost(
              repository: i.get<StockListRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListRegisterPut(
              repository: i.get<StockListRepositoryImpl>()),
        ),
        BlocBind.factory(
          (i) => StockListBloc(
            getlist: i.get<StockListRegisterGetlist>(),
            delete: i.get<StockListRegisterDelete>(),
            post: i.get<StockListRegisterPost>(),
            put: i.get<StockListRegisterPut>(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const StockListRegister()),
  ];
}
