import 'package:appweb/app/modules/cashier/presentation/menu/cashier_menu_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  group('CashierMenuMobile', () {
    testWidgets('renders menu with Saldo, Extrato and Fechamento',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await pumpApp(
        tester,
        Scaffold(
          body: const CashierMenuMobile(),
        ),
      );

      expect(find.text('Saldo'), findsOneWidget);
      expect(find.text('Extrato'), findsOneWidget);
      expect(find.text('Fechamento'), findsOneWidget);
    });

    testWidgets('renders three menu items', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await pumpApp(
        tester,
        Scaffold(
          body: const CashierMenuMobile(),
        ),
      );

      expect(find.byIcon(Icons.home), findsNWidgets(3));
    });
  });
}
