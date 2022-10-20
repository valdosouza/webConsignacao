import 'package:appweb/app/modules/stock_list_register/data/datasource/remote/ownapi/stock_list_datasource.dart';
import 'package:appweb/app/modules/stock_list_register/data/repositories/stock_list_repository_impl.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usescases/stock_list_getlist.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_bloc.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/pages/stock_list_register.dart';
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
          (i) => StockListGetlist(repository: i.get<StockListRepositoryImpl>()),
        ),
        BlocBind.factory(
          (i) => StockListBloc(getlist: i.get<StockListGetlist>()),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const StockListRegister()),
  ];
}
