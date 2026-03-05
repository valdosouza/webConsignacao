import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/content/sales_route_list_mobile.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_attendance_by_route_bloc.dart';

void main() {
  group('SalesRouteListMobile', () {
    testWidgets('shows empty state when lista is empty',
        (WidgetTester tester) async {
      final bloc = createFakeAttendanceByRouteBloc(salesRouteList: []);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceByRouteBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SalesRouteListMobile(lista: [], bloc: bloc),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text('Não encontramos nenhum registro em nossa base.'),
          findsOneWidget);
    });

    testWidgets('shows route description for each item',
        (WidgetTester tester) async {
      final list = [
        SalesRouteListModel(id: 1, description: 'Rota Norte'),
        SalesRouteListModel(id: 2, description: 'Rota Sul'),
      ];
      final bloc = createFakeAttendanceByRouteBloc(salesRouteList: list);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceByRouteBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SalesRouteListMobile(lista: list, bloc: bloc),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Rota Norte'), findsOneWidget);
      expect(find.text('Rota Sul'), findsOneWidget);
    });
  });
}
