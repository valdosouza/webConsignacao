import 'package:appweb/app/modules/cashier_statement/presentation/menu/cashier_statement_menu_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_cashier_statement_bloc.dart';
import '../../../../../helpers/pump_app.dart';

void main() {
  group('CashierStatementMenuMobile', () {
    testWidgets('renders Do dia, Do mês, Clientes Atendidos and Débitos after bloc loads',
        (WidgetTester tester) async {
      final bloc = createFakeCashierStatementBloc(dtRecordForToday: '24/02/2025');

      await pumpApp(
        tester,
        Scaffold(
          body: CashierStatementMenuMobile(bloc: bloc),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.textContaining('Do dia'), findsOneWidget);
      expect(find.textContaining('Do mês'), findsOneWidget);
      expect(find.text('Clientes Atendidos'), findsOneWidget);
      expect(find.text('Débitos de Clientes'), findsOneWidget);
    });

    testWidgets('shows Do dia with date from bloc', (WidgetTester tester) async {
      final bloc = createFakeCashierStatementBloc(dtRecordForToday: '10/02/2025');

      await pumpApp(
        tester,
        Scaffold(
          body: CashierStatementMenuMobile(bloc: bloc),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text('Do dia - 10/02/2025'), findsOneWidget);
    });
  });
}
