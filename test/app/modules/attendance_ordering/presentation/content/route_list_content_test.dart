import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/content/route_list_content.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_attendance_ordering_bloc.dart';

void main() {
  group('RouteListContent', () {
    testWidgets('shows title Descrição da Rota', (WidgetTester tester) async {
      final bloc = createFakeAttendanceOrderingBloc(routeList: []);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceOrderingBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SizedBox(
                height: 800,
                child: RouteListContent(list: [], bloc: bloc),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Descrição da Rota'), findsOneWidget);
    });

    testWidgets('shows route description for each item',
        (WidgetTester tester) async {
      final list = [
        SalesRouteRegisterModel(id: 1, description: 'Rota Segunda'),
        SalesRouteRegisterModel(id: 2, description: 'Rota Terça'),
      ];
      final bloc = createFakeAttendanceOrderingBloc(routeList: list);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceOrderingBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SizedBox(
                height: 800,
                child: RouteListContent(list: list, bloc: bloc),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Rota Segunda'), findsOneWidget);
      expect(find.text('Rota Terça'), findsOneWidget);
    });
  });
}
