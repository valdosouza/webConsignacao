import 'package:appweb/app/modules/auth/domain/repository/auth_repository.dart';
import 'package:appweb/app/modules/auth/domain/usecase/change_password.dart';
import 'package:appweb/app/modules/auth/domain/usecase/login_email.dart';
import 'package:appweb/app/modules/auth/domain/usecase/recovery_password.dart';
import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/page/auth_change_password_page.dart';
import 'package:appweb/app/modules/auth/presentation/page/auth_page.dart';
import 'package:appweb/app/modules/auth/presentation/page/auth_recovery_password_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'integration_fakes.dart';

/// Auth module that uses [IntegrationFakeAuthRepository] for E2E tests.
class AuthModuleTest extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<AuthRepository>(
          (i) => IntegrationFakeAuthRepository(),
        ),
        Bind((i) => LoginEmail(repository: i.get<AuthRepository>())),
        Bind((i) => RecoveryPassword(repository: i.get<AuthRepository>())),
        Bind((i) => ChangePassword(repository: i.get<AuthRepository>())),
        BlocBind.singleton((i) => AuthBloc(
              loginEmail: i.get<LoginEmail>(),
              recovery: i.get<RecoveryPassword>(),
              change: i.get<ChangePassword>(),
            )),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
    ChildRoute('/recovery-password/',
        child: (_, args) => const AuthRecoveryPasswordPage()),
    ChildRoute('/change-password/',
        child: (_, args) => const AuthChangePasswordPage()),
  ];
}
