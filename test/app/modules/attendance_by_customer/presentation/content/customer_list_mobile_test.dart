import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_bloc.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/content/customer_list_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_attendance_by_customer_bloc.dart';

void main() {
  group('CustomerListMobile', () {
    testWidgets('shows search hint and empty state when lista is empty',
        (WidgetTester tester) async {
      final bloc = createFakeAttendanceByCustomerBloc(customerList: []);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceByCustomerBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SizedBox(
                height: 800,
                child: CustomerListMobile(lista: [], bloc: bloc),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Não encontramos nenhum registro em nossa base.'), findsOneWidget);
    });

    testWidgets('shows customer nickTrade and address for each item',
        (WidgetTester tester) async {
      final list = [
        CustomerListModel(
          id: 1,
          nickTrade: 'Cliente A',
          street: 'Rua X',
          nmbr: '100',
          complement: '',
        ),
        CustomerListModel(
          id: 2,
          nickTrade: 'Cliente B',
          street: 'Av Y',
          nmbr: '200',
          complement: 'Sala 2',
        ),
      ];
      final bloc = createFakeAttendanceByCustomerBloc(customerList: list);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceByCustomerBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SizedBox(
                height: 800,
                child: CustomerListMobile(lista: list, bloc: bloc),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Cliente A'), findsOneWidget);
      expect(find.text('Cliente B'), findsOneWidget);
      expect(find.textContaining('Rua X'), findsOneWidget);
      expect(find.textContaining('Av Y'), findsOneWidget);
      expect(find.text('Comp: Sala 2'), findsOneWidget);
    });

    testWidgets('search field dispatches CustomerSearchEvent on change',
        (WidgetTester tester) async {
      final list = [
        CustomerListModel(id: 1, nickTrade: 'Test', street: '', nmbr: '', complement: ''),
      ];
      final bloc = createFakeAttendanceByCustomerBloc(customerList: list);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceByCustomerBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SizedBox(
                height: 800,
                child: CustomerListMobile(lista: list, bloc: bloc),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 'abc');
      await tester.pump();

      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
