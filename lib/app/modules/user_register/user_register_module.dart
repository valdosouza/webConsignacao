import 'package:appweb/app/modules/user_register/data/datasource/user_register_datasource.dart';
import 'package:appweb/app/modules/user_register/data/repository/user_repository_impl.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_add.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_getlist.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_bloc.dart';
import 'package:appweb/app/modules/user_register/presentation/pages/user_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class UserRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<UserRegisterDataSource>(
          (i) => UserRegisterDataSourceImpl(),
        ),
        Bind.factory(
          (i) => UserRegisterRepositoryImpl(
              datasource: i.get<UserRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => UserRegisterGetlist(
              repository: i.get<UserRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) =>
              UserRegisterAdd(repository: i.get<UserRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => UserRegisterBloc(
              getlist: i.get<UserRegisterGetlist>(),
              addUser: i.get<UserRegisterAdd>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const UserRegister()),
  ];
}
