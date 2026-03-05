import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/event.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/state.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/content/customer_list_content.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_attendance_ordering_bloc.dart';

void main() {
  group('CustomerListContent', () {
    testWidgets('shows empty state when customerList is empty',
        (WidgetTester tester) async {
      final bloc = createFakeAttendanceOrderingBloc(customerList: []);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceOrderingBloc>.value(
            value: bloc,
            child: Scaffold(
              body: CustomerListContent(bloc: bloc),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text('Não encontramos nenhum registro em nossa base.'),
          findsOneWidget);
    });

    testWidgets('shows customer nickTrade and address after GetCustomerListEvent',
        (WidgetTester tester) async {
      final list = [
        CustomerListByRouteModel(
          id: 1,
          nickTrade: 'Cliente Ordenação A',
          street: 'Rua X',
          nmbr: '100',
          complement: '',
          defaultSeq: 1,
        ),
        CustomerListByRouteModel(
          id: 2,
          nickTrade: 'Cliente Ordenação B',
          street: 'Av Y',
          nmbr: '200',
          complement: 'Sala 2',
          defaultSeq: 2,
        ),
      ];
      final bloc = createFakeAttendanceOrderingBloc(customerList: list);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceOrderingBloc>.value(
            value: bloc,
            child: BlocBuilder<AttendanceOrderingBloc, AttendanceOrderingState>(
              bloc: bloc,
              builder: (context, state) => Scaffold(
                body: CustomerListContent(bloc: bloc),
              ),
            ),
          ),
        ),
      );
      bloc.add(GetCustomerListEvent(
          params: ParamsGetCustomer(tbRegionId: 1, tbSalesRouteId: 1)));
      await tester.pumpAndSettle();

      expect(find.text('Cliente Ordenação A'), findsOneWidget);
      expect(find.text('Cliente Ordenação B'), findsOneWidget);
      expect(find.textContaining('Rua X'), findsOneWidget);
      expect(find.textContaining('Av Y'), findsOneWidget);
    });
  });
}
