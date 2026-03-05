import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/widget/cashier_balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_cashier_balance_bloc.dart';
import '../../../../../helpers/pump_app.dart';

/// CashierBalanceWidget root is [Expanded]; it must be inside a [Column] or [Row].
Widget wrapBalanceWidget(CashierBalanceWidget widget) {
  return Scaffold(
    body: Column(
      children: [widget],
    ),
  );
}

void main() {
  group('CashierBalanceWidget', () {
    testWidgets('renders Saldo Atual and header Forma de Pagamento / Valor',
        (WidgetTester tester) async {
      final bloc = FakeCashierBalanceBloc(
        initialBalance: CashierBalanceModel(
          dtRecord: '24/02/2025',
          items: [],
        ),
      );

      await pumpApp(
        tester,
        wrapBalanceWidget(CashierBalanceWidget(bloc: bloc)),
      );

      expect(find.text('Saldo Atual'), findsOneWidget);
      expect(find.text('Forma de Pagamento'), findsOneWidget);
      expect(find.text('Valor'), findsOneWidget);
    });

    testWidgets('shows Data with bloc dtRecord', (WidgetTester tester) async {
      final bloc = FakeCashierBalanceBloc(
        initialBalance: CashierBalanceModel(
          dtRecord: '10/02/2025',
          items: [],
        ),
      );

      await pumpApp(tester, wrapBalanceWidget(CashierBalanceWidget(bloc: bloc)));

      expect(find.text('Data: 10/02/2025'), findsOneWidget);
    });

    testWidgets('shows payment type and value in list', (WidgetTester tester) async {
      final bloc = FakeCashierBalanceBloc(
        initialBalance: CashierBalanceModel(
          dtRecord: '24/02/2025',
          items: [
            CashierBalanceItemsModel(
              namePaymentType: 'Dinheiro',
              balanceValue: 150.50,
            ),
            CashierBalanceItemsModel(
              namePaymentType: 'PIX',
              balanceValue: 200.0,
            ),
          ],
        ),
      );

      await pumpApp(tester, wrapBalanceWidget(CashierBalanceWidget(bloc: bloc)));

      expect(find.text('Dinheiro'), findsOneWidget);
      expect(find.text('PIX'), findsOneWidget);
      expect(find.text('150.50'), findsOneWidget);
      expect(find.text('200.00'), findsOneWidget);
    });

    testWidgets('shows Valor total when items exist', (WidgetTester tester) async {
      final bloc = FakeCashierBalanceBloc(
        initialBalance: CashierBalanceModel(
          dtRecord: '24/02/2025',
          items: [
            CashierBalanceItemsModel(
              namePaymentType: 'Dinheiro',
              balanceValue: 100.0,
            ),
          ],
        ),
      );

      await pumpApp(tester, wrapBalanceWidget(CashierBalanceWidget(bloc: bloc)));

      expect(find.textContaining('Valor: R\$'), findsOneWidget);
      expect(find.text('100.00'), findsOneWidget);
    });
  });
}
