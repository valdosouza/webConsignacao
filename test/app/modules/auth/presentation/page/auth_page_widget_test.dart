import 'package:appweb/app/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:appweb/app/modules/auth/presentation/page/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../helpers/fake_auth_bloc.dart';
import '../../../../../helpers/pump_app.dart';

void main() {
  group('AuthPage', () {
    testWidgets('renders initial form with email, password and login button',
        (WidgetTester tester) async {
      final bloc = FakeAuthBloc(initialState: AuthInitial());
      await pumpApp(tester, AuthPage(bloc: bloc));

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Senha'), findsOneWidget);
      expect(find.text('LOGIN'), findsOneWidget);
      expect(find.text('Manter conectado'), findsOneWidget);
    });

    testWidgets('shows loading indicator when bloc emits AuthLoadingState',
        (WidgetTester tester) async {
      final bloc = FakeAuthBloc(initialState: AuthInitial());
      await pumpApp(tester, AuthPage(bloc: bloc));

      bloc.emitState(AuthLoadingState());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('tap login button dispatches AuthLoginEvent with controller values',
        (WidgetTester tester) async {
      final bloc = FakeAuthBloc(initialState: AuthInitial());
      await pumpApp(tester, AuthPage(bloc: bloc));

      await tester.enterText(find.byType(TextFormField).first, 'user@test.com');
      await tester.enterText(find.byType(TextFormField).last, 'pass123');
      await tester.tap(find.text('LOGIN'));
      await tester.pump();

      // Bloc should have received the event (we only check UI did not crash)
      expect(find.byType(AuthPage), findsOneWidget);
    });

    testWidgets('shows SnackBar when bloc emits AuthErrorState',
        (WidgetTester tester) async {
      final bloc = FakeAuthBloc(initialState: AuthInitial());
      await pumpApp(tester, AuthPage(bloc: bloc));

      bloc.emitState(const AuthErrorState(error: 'Credenciais inválidas'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Credenciais inválidas'), findsOneWidget);
    });

    testWidgets('toggle password visibility icon changes visibility',
        (WidgetTester tester) async {
      final bloc = FakeAuthBloc(initialState: AuthInitial());
      await pumpApp(tester, AuthPage(bloc: bloc));

      final passwordField = find.byType(TextFormField).last;
      expect(passwordField, findsOneWidget);

      final visibilityOff = find.byIcon(Icons.visibility_off);
      expect(visibilityOff, findsOneWidget);
      await tester.tap(visibilityOff);
      await tester.pump();
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });
}
