import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/widget/cashier_closure_widget.dart';
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
  group('CashierClosureWidget', () {
    testWidgets('renders title', (WidgetTester tester) async {
      await pumpApp(
        tester,
        wrapSliver(const CashierClosureWidget(
          title: 'Fechamento 24/02/2025',
          model: [],
        )),
      );

      expect(find.text('Fechamento 24/02/2025'), findsOneWidget);
    });

    testWidgets('renders list items with description and value',
        (WidgetTester tester) async {
      final items = [
        ClosureItemsModel(description: 'Vendas', tagValue: 1500.50),
        ClosureItemsModel(description: 'Recebimentos', tagValue: 800.00),
      ];

      await pumpApp(
        tester,
        wrapSliver(CashierClosureWidget(title: 'Resumo', model: items)),
      );

      expect(find.text('Vendas'), findsOneWidget);
      expect(find.text('Recebimentos'), findsOneWidget);
      expect(find.text('1,500.50'), findsOneWidget);
      expect(find.text('800.00'), findsOneWidget);
    });

    testWidgets('renders list with item descriptions', (WidgetTester tester) async {
      final items = [
        ClosureItemsModel(description: 'Item A', tagValue: 10.0),
        ClosureItemsModel(description: 'Item B', tagValue: 20.0),
      ];

      await pumpApp(
        tester,
        wrapSliver(CashierClosureWidget(title: 'Título', model: items)),
      );

      expect(find.text('Item A'), findsOneWidget);
      expect(find.text('Item B'), findsOneWidget);
      expect(find.text('10.00'), findsOneWidget);
      expect(find.text('20.00'), findsOneWidget);
    });
  });
}
