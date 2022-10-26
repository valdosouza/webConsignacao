import 'package:appweb/app/modules/auth/data/datasource/remote/ownapi/auth_datasource.dart';
import 'package:appweb/app/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:appweb/app/modules/auth/domain/usecase/login_email.dart';
import 'package:appweb/app/modules/auth/domain/usecase/recovery_password.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/pages/auth_page.dart';
import 'package:appweb/app/modules/auth/presentation/pages/auth_recovery_password_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<AuthDatasourceImpl>(
          (i) => AuthDatasourceImpl(),
        ),
        Bind.singleton(
          (i) => AuthRepositoryImpl(datasource: i.get<AuthDatasourceImpl>()),
        ),
        Bind(
          (i) => LoginEmail(repository: i.get<AuthRepositoryImpl>()),
        ),
        Bind(
          (i) => RecoveryPassword(repository: i.get<AuthRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => AuthBloc(
              loginEmail: i.get<LoginEmail>(),
              recovery: i.get<RecoveryPassword>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
    ChildRoute('/recovery-password',
        child: (_, args) => const AuthRecoveryPasswordPage()),
  ];
}
