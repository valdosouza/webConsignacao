import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/content/region_list_content.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/fake_attendance_ordering_bloc.dart';

void main() {
  group('RegionListContent', () {
    testWidgets('shows empty state when list is empty',
        (WidgetTester tester) async {
      final bloc = createFakeAttendanceOrderingBloc(regionList: []);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceOrderingBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SizedBox(
                height: 800,
                child: RegionListContent(list: [], bloc: bloc),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Descrição da Região'), findsOneWidget);
    });

    testWidgets('shows region description for each item',
        (WidgetTester tester) async {
      final list = [
        RegionModel(id: 1, description: 'Região Norte'),
        RegionModel(id: 2, description: 'Região Sul'),
      ];
      final bloc = createFakeAttendanceOrderingBloc(regionList: list);

      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AttendanceOrderingBloc>.value(
            value: bloc,
            child: Scaffold(
              body: SizedBox(
                height: 800,
                child: RegionListContent(list: list, bloc: bloc),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Região Norte'), findsOneWidget);
      expect(find.text('Região Sul'), findsOneWidget);
    });
  });
}
