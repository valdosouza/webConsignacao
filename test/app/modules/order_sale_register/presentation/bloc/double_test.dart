import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Double drift', () {
    test('0.1 + 0.2 != 0.3 exatamente', () {
      final sum = 0.1 + 0.2;
      expect(sum == 0.3, isFalse);
      expect(sum, closeTo(0.3, 1e-12));
      expect(sum.toStringAsFixed(17), isNot('0.30000000000000000'));
    });

    test('27,80 ~ 27.80 (literal)', () {
      const preco = 27.80;
      expect(preco, closeTo(27.80, 1e-12));
      expect(preco == 27.80, isTrue);
      expect(preco.toStringAsFixed(2), '27.80');
    });

    test('37,80 ~ 37.80', () {
      const preco = 37.80;
      expect(preco, closeTo(37.80, 0.00001));
      expect(preco == 37.80, isTrue);
      expect(preco.toStringAsFixed(2), '37.80');
    });

  });
}