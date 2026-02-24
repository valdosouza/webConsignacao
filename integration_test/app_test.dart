import 'package:appweb/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_app_module.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Flow 1: open app, splash redirects to auth, auth screen shows',
      (WidgetTester tester) async {
    runApp(
      ModularApp(
        module: TestAppModule(),
        child: const AppWidget(),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 15));

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets(
      'Flow 2: login with fake backend, navigate to home, verify content',
      (WidgetTester tester) async {
    runApp(
      ModularApp(
        module: TestAppModule(),
        child: const AppWidget(),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 15));

    await tester.enterText(find.byType(TextFormField).first, 'test@test.com');
    await tester.enterText(find.byType(TextFormField).last, 'password');
    await tester.tap(find.text('LOGIN'));
    await tester.pumpAndSettle(const Duration(seconds: 15));

    expect(find.text('Consignação e Venda'), findsWidgets);
  });
}
