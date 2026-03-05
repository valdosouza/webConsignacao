import 'package:appweb/app/modules/cashier_closure/presentation/menu/cashier_closure_menu_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_cashier_closure_bloc.dart';
import '../../../../../helpers/pump_app.dart';

void main() {
  group('CashierClosureMenuMobile', () {
    testWidgets('renders Hoje, Ontem and Anteriores after bloc loads',
        (WidgetTester tester) async {
      final bloc = createFakeCashierClosureBloc(dtRecordForToday: '24/02/2025');

      await pumpApp(
        tester,
        Scaffold(
          body: CashierClosureMenuMobile(bloc: bloc),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.textContaining('Hoje'), findsOneWidget);
      expect(find.textContaining('Ontem'), findsOneWidget);
      expect(find.text('Anteriores'), findsOneWidget);
    });

    testWidgets('shows Hoje with date from bloc', (WidgetTester tester) async {
      final bloc = createFakeCashierClosureBloc(dtRecordForToday: '10/02/2025');

      await pumpApp(
        tester,
        Scaffold(
          body: CashierClosureMenuMobile(bloc: bloc),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Hoje - 10/02/2025'), findsOneWidget);
    });
  });
}
