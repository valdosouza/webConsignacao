import 'package:appweb/app/modules/line_business_register/data/datasource/remote/ownapi/line_business_data_source.dart';
import 'package:appweb/app/modules/line_business_register/data/repositories/line_business_repository_impl.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_add.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_delete.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_getlist.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_put.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LineBusinessModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => LineBusinessDataSourceImpl()),
    Bind.factory((i) => LineBusinessRepositoryImpl(
        datasource: i.get<LineBusinessDataSourceImpl>())),
    Bind.factory((i) =>
        LineBusinessGetlist(repository: i.get<LineBusinessRepositoryImpl>())),
    Bind.factory((i) =>
        LineBusinessAdd(repository: i.get<LineBusinessRepositoryImpl>())),
    Bind.factory((i) =>
        LineBusinessPut(repository: i.get<LineBusinessRepositoryImpl>())),
    Bind.factory((i) =>
        LineBusinessDelete(repository: i.get<LineBusinessRepositoryImpl>())),
    Bind.lazySingleton((i) => LineBusinessBloc(
          addLineBusiness: i.get<LineBusinessAdd>(),
          deleteLineBusiness: i.get<LineBusinessDelete>(),
          getlistLineBusiness: i.get<LineBusinessGetlist>(),
          putLineBusiness: i.get<LineBusinessPut>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [];
}
