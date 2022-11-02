import 'package:appweb/app/modules/sales_register/data/datasource/remote/ownapi/sales_data_source.dart';
import 'package:appweb/app/modules/sales_register/data/repository/sales_register_repository_impl.dart';
import 'package:appweb/app/modules/sales_register/domain/usecases/sales_register_post.dart';
import 'package:appweb/app/modules/sales_register/presentation/bloc/sales_bloc.dart';
import 'package:appweb/app/modules/sales_register/presentation/pages/sales_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class SalesRegisterModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<SalesDataSource>(
          (i) => SalesDataSourceImpl(),
        ),
        Bind.factory(
          (i) => SalesRepositoryImpl(
            datasource: i.get<SalesDataSourceImpl>(),
          ),
        ),
        Bind.factory(
          (i) => SalesPost(
            repository: i.get<SalesRepositoryImpl>(),
          ),
        ),
        BlocBind.factory(
          (i) => SalesBloc(
            post: i.get<SalesPost>(),
          ),
        ),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const SalesRegister()),
      ];
}
