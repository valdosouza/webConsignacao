import 'package:appweb/app/modules/user_register/data/datasource/user_register_datasource.dart';
import 'package:appweb/app/modules/user_register/data/repository/user_repository_impl.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_post.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_delete.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_put.dart';
import 'package:appweb/app/modules/user_register/domain/usecase/user_register_getlist.dart';
import 'package:appweb/app/modules/user_register/presentation/bloc/user_register_bloc.dart';
import 'package:appweb/app/modules/user_register/presentation/pages/user_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class UserRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<UserRegisterDataSource>(
          (i) => UserRegisterDataSourceImpl(httpClient: http.Client()),
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
              UserRegisterPost(repository: i.get<UserRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) =>
              UserRegisterPut(repository: i.get<UserRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => UserRegisterDelete(
              repository: i.get<UserRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => UserRegisterBloc(
              getlistUser: i.get<UserRegisterGetlist>(),
              postUser: i.get<UserRegisterPost>(),
              putUser: i.get<UserRegisterPut>(),
              deleteUser: i.get<UserRegisterDelete>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const UserRegister()),
  ];
}
