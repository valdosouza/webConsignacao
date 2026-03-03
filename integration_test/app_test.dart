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

  testWidgets(
      'Flow 3: after login, navigate to cashier and verify menu (Saldo, Extrato, Fechamento)',
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

    Modular.to.navigate('/cashier/mobile/');
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Saldo'), findsOneWidget);
    expect(find.text('Extrato'), findsOneWidget);
    expect(find.text('Fechamento'), findsOneWidget);
  });

  testWidgets(
      'Flow 4: after login, navigate to cashier balance and verify screen',
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

    Modular.to.navigate('/cashierbalance/');
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Consignação e Venda'), findsWidgets);
    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 5: after login, navigate to cashier closure and verify screen',
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

    Modular.to.navigate('/cashierclosure/mobile/');
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Fechamento'), findsWidgets);
    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 6: after login, navigate to cashier statement and verify screen',
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

    Modular.to.navigate('/cashierstatement/mobile/');
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Consignação e Venda'), findsWidgets);
    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 7: after login, navigate to cashier statement summary and verify screen',
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

    Modular.to.navigate('/cashierstatementsummary/desktop/cashierstatementsummary/monthly/');
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Consignação e Venda'), findsWidgets);
    expect(find.text('Resumo mensal de operações'), findsOneWidget);
  });

  testWidgets(
      'Flow 8: after login, navigate to attendance by customer and verify screen',
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

    Modular.to.navigate('/attendancecustomer/mobile/');
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Consignação e Venda'), findsWidgets);
    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 9: after login, navigate to attendance by route and verify screen',
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

    Modular.to.navigate('/attendancesalesroute/mobile/',
        arguments: [0, 'Rotas', 1, 'Região']);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Consignação e Venda'), findsWidgets);
    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 10: after login, navigate to attendance ordering and verify screen',
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

    Modular.to.navigate('/customer/desktop/attendance-ordering/');
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Ordenação de Atendimento'), findsOneWidget);
  });
}
