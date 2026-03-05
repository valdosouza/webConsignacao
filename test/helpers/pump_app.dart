import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Pumps [widget] inside a [MaterialApp] with a fixed surface size
/// so responsive breakpoints are deterministic (e.g. mobile < 600).
Future<void> pumpApp(
  WidgetTester tester,
  Widget widget, {
  Size surfaceSize = const Size(400, 800),
}) async {
  await tester.binding.setSurfaceSize(surfaceSize);
  await tester.pumpWidget(
    MaterialApp(
      home: widget,
    ),
  );
}

/// Pumps and waits for animations to settle (max [duration]).
/// Use with care to avoid indefinite waits; prefer explicit pumps when possible.
Future<void> pumpAndSettleSafe(
  WidgetTester tester, {
  Duration duration = const Duration(seconds: 10),
}) async {
  await tester.pumpAndSettle(duration);
}
