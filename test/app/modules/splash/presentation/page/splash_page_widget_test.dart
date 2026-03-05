import 'package:appweb/app/modules/splash/presentation/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../helpers/fake_splash_bloc.dart';
import '../../../../../helpers/pump_app.dart';

void main() {
  group('SplashPage', () {
    testWidgets('renders loading indicator initially', (WidgetTester tester) async {
      final bloc = FakeSplashBloc();
      await pumpApp(tester, SplashPage(bloc: bloc));

      expect(find.byType(Material), findsWidgets);
    });
  });
}
