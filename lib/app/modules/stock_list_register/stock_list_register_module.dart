import 'package:appweb/app/modules/stock_list_register/data/datasource/remote/ownapi/stock_list_datasource.dart';
import 'package:appweb/app/modules/stock_list_register/data/repositories/stock_list_repository_impl.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usescases/stock_list_getlist.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/stock_list_cubit/stock_list_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class StockListRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<StockListDatasource>(
          (i) => StockListDatasourceImpl(),
          //onDispose: (stocklistImpl) => stocklist.
        ),
        Bind.factory(
          (i) => StockListRepositoryImpl(
              datasource: i.get<StockListDatasourceImpl>()),
          //onDispose: (authRep) => authRep.close(),
        ),
        Bind.factory(
          (i) => StockListGetlist(repository: i.get<StockListRepositoryImpl>()),
          //onDispose: (loginemail) => loginemail.close(),
        ),
        BlocBind.factory((i) => StockListCubit(i()))
      ];
  @override
  final List<ModularRoute> routes = [];
}
