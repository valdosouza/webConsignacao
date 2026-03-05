import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/content/customer_list_mobile.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_attendance_by_route_bloc.dart';

void main() {
  group('CustomerListMobile (attendance_by_route)', () {
    testWidgets('shows Filtro and empty state when lista is empty',
        (WidgetTester tester) async {
      final bloc = createFakeAttendanceByRouteBloc(customerList: []);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceByRouteBloc>.value(
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

      expect(find.text('Filtro: '), findsOneWidget);
      expect(
          find.text('Não encontramos nenhum registro em nossa base.'),
          findsOneWidget);
    });

    testWidgets('shows customer nickTrade and address for each item',
        (WidgetTester tester) async {
      final list = [
        CustomerListByRouteModel(
          id: 1,
          nickTrade: 'Cliente Rota A',
          street: 'Rua X',
          nmbr: '100',
          complement: '',
          sequence: 1,
        ),
        CustomerListByRouteModel(
          id: 2,
          nickTrade: 'Cliente Rota B',
          street: 'Av Y',
          nmbr: '200',
          complement: 'Sala 2',
          sequence: 2,
        ),
      ];
      final bloc = createFakeAttendanceByRouteBloc(customerList: list);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceByRouteBloc>.value(
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

      expect(find.text('Cliente Rota A'), findsOneWidget);
      expect(find.text('Cliente Rota B'), findsOneWidget);
      expect(find.textContaining('Rua X'), findsOneWidget);
      expect(find.textContaining('Av Y'), findsOneWidget);
      expect(find.text('Comp: Sala 2'), findsOneWidget);
    });
  });
}
