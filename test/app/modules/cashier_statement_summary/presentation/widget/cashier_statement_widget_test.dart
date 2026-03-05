import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/widget/cashier_statement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

Widget wrapSliver(Widget sliver) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [sliver],
    ),
  );
}

void main() {
  group('CashierStatementSummary CashierStatementWidget', () {
    testWidgets('renders title', (WidgetTester tester) async {
      await pumpApp(
        tester,
        wrapSliver(const CashierStatementWidget(
          title: 'Resumo mensal',
          model: [],
        )),
      );

      expect(find.text('Resumo mensal'), findsOneWidget);
    });

    testWidgets('renders list items with description and value',
        (WidgetTester tester) async {
      final items = [
        CashierStatementModel(
            description: 'Vendas', tagValue: 1500.50, kind: 'S', color: 'blue'),
        CashierStatementModel(
            description: 'Total',
            tagValue: 800.00,
            kind: 'R',
            color: 'green'),
      ];

      await pumpApp(
        tester,
        wrapSliver(CashierStatementWidget(title: 'Resumo', model: items)),
      );

      expect(find.text('Vendas'), findsOneWidget);
      expect(find.text('Total'), findsOneWidget);
      expect(find.text('1,500.50'), findsOneWidget);
      expect(find.text('800.00'), findsOneWidget);
    });

    testWidgets('renders list with item descriptions',
        (WidgetTester tester) async {
      final items = [
        CashierStatementModel(
            description: 'Item A', tagValue: 10.0, kind: 'S', color: 'black'),
        CashierStatementModel(
            description: 'Item B', tagValue: 20.0, kind: 'S', color: 'black'),
      ];

      await pumpApp(
        tester,
        wrapSliver(CashierStatementWidget(title: 'Título', model: items)),
      );

      expect(find.text('Item A'), findsOneWidget);
      expect(find.text('Item B'), findsOneWidget);
      expect(find.text('10.00'), findsOneWidget);
      expect(find.text('20.00'), findsOneWidget);
    });
  });
}
