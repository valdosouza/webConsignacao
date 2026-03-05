import 'package:appweb/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_app_module.dart';

/// Pumps until [finder] matches or [timeout] expires. Avoids pumpAndSettle
/// which times out with infinite animations (e.g. CircularProgressIndicator).
Future<void> pumpUntil(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 10),
  Duration step = const Duration(milliseconds: 200),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(step);
    if (tester.any(finder)) return;
  }
  throw TestFailure('Timeout waiting for finder: $finder');
}

Future<void> pumpUntilAny(
  WidgetTester tester,
  List<Finder> finders, {
  Duration timeout = const Duration(seconds: 10),
  Duration step = const Duration(milliseconds: 200),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(step);
    if (finders.any(tester.any)) return;
  }
  throw TestFailure('Timeout waiting for any finder: $finders');
}

Future<void> pumpUntilCondition(
  WidgetTester tester,
  bool Function() condition, {
  Duration timeout = const Duration(seconds: 10),
  Duration step = const Duration(milliseconds: 200),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(step);
    if (condition()) return;
  }
  throw TestFailure('Timeout waiting for condition.');
}

Future<void> launchAppToAuth(WidgetTester tester, {bool desktop = false}) async {
  if (desktop) {
    tester.view.physicalSize = const Size(1200, 800);
    addTearDown(tester.view.resetPhysicalSize);
  }

  runApp(
    ModularApp(
      module: TestAppModule(),
      child: const AppWidget(),
    ),
  );
  // Unmount tree to reduce async spill between tests.
  addTearDown(() async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });

  await pumpUntil(tester, find.text('Email'));
}

Future<void> loginAndWaitHome(WidgetTester tester) async {
  await tester.enterText(find.byType(TextFormField).first, 'test@test.com');
  await tester.enterText(find.byType(TextFormField).last, 'password');
  await tester.tap(find.text('LOGIN'));
  await tester.pump();
  await pumpUntilCondition(
    tester,
    () => !tester.any(find.text('LOGIN')) && !tester.any(find.text('Email')),
  );
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.onlyPumps;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Flow 1: open app, splash redirects to auth, auth screen shows',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets(
      'Flow 2: login with fake backend, navigate to home, verify content',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    expect(
      tester.any(find.text('Consignação e Venda')) ||
          tester.any(find.text('Consginação e Venda')),
      isTrue,
    );
  });

  testWidgets(
      'Flow 3: after login, navigate to cashier and verify menu (Saldo, Extrato, Fechamento)',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/cashier/mobile/');
    await tester.pump();
    await pumpUntil(tester, find.text('Saldo'));

    expect(find.text('Saldo'), findsOneWidget);
    expect(find.text('Extrato'), findsOneWidget);
    expect(find.text('Fechamento'), findsOneWidget);
  });

  testWidgets(
      'Flow 4: after login, navigate to cashier balance and verify screen',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/cashierbalance/');
    await tester.pump();
    await pumpUntil(tester, find.byIcon(Icons.arrow_back_ios_outlined));

    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 5: after login, navigate to cashier closure and verify screen',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/cashierclosure/mobile/');
    await tester.pump();
    await pumpUntil(tester, find.byIcon(Icons.arrow_back_ios_outlined));

    expect(find.text('Fechamento'), findsWidgets);
    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 6: after login, navigate to cashier statement and verify screen',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/cashierstatement/mobile/');
    await tester.pump();
    await pumpUntil(tester, find.byIcon(Icons.arrow_back_ios_outlined));

    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 7: after login, navigate to cashier statement summary and verify screen',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/cashierstatementsummary/desktop/cashierstatementsummary/monthly/');
    await tester.pump();
    await pumpUntil(tester, find.text('Resumo mensal de operações'));

    expect(find.text('Resumo mensal de operações'), findsOneWidget);
  });

  testWidgets(
      'Flow 8: after login, navigate to attendance by customer and verify screen',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/attendancecustomer/mobile/');
    await tester.pump();
    await pumpUntil(tester, find.byIcon(Icons.arrow_back_ios_outlined));

    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 9: after login, navigate to attendance by route and verify screen',
      (WidgetTester tester) async {
    await launchAppToAuth(tester);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/attendancesalesroute/mobile/',
        arguments: [0, 'Rotas', 1, 'Região']);
    await tester.pump();
    await pumpUntil(tester, find.byIcon(Icons.arrow_back_ios_outlined));

    expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
  });

  testWidgets(
      'Flow 10: after login, navigate to attendance ordering and verify screen',
      (WidgetTester tester) async {
    await launchAppToAuth(tester, desktop: true);
    await loginAndWaitHome(tester);

    Modular.to.navigate('/customer/desktop/attendance-ordering/');
    await pumpUntil(tester, find.text('Ordenação de Atendimento'));

    expect(find.text('Ordenação de Atendimento'), findsOneWidget);
  });
}
