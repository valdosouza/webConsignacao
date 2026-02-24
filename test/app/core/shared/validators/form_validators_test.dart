import 'package:appweb/app/core/shared/validators/form_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validateEmail', () {
    test('returns null for valid email', () {
      expect(validateEmail('user@example.com'), isNull);
      expect(validateEmail('valdo@setes.com.br'), isNull);
      expect(validateEmail('a+b@c.co'), isNull);
    });

    test('returns error for empty or null', () {
      expect(validateEmail(null), isNotNull);
      expect(validateEmail(''), isNotNull);
      expect(validateEmail(''), contains('obrigatório'));
    });

    test('returns error for invalid email', () {
      expect(validateEmail('invalid'), isNotNull);
      expect(validateEmail('no-at.com'), isNotNull);
      expect(validateEmail('@nodomain.com'), isNotNull);
    });
  });

  group('validateRequired', () {
    test('returns null for non-empty value', () {
      expect(validateRequired('text'), isNull);
      expect(validateRequired('  a  '), isNull);
    });

    test('returns error for null or empty', () {
      expect(validateRequired(null), isNotNull);
      expect(validateRequired(''), isNotNull);
      expect(validateRequired('   '), isNotNull);
      expect(validateRequired('', 'Nome'), contains('Nome'));
    });
  });

  group('validatePassword', () {
    test('returns null for password meeting min length', () {
      expect(validatePassword('a', minLength: 1), isNull);
      expect(validatePassword('123456', minLength: 4), isNull);
    });

    test('returns error for null or too short', () {
      expect(validatePassword(null), isNotNull);
      expect(validatePassword('', minLength: 1), isNotNull);
      expect(validatePassword('ab', minLength: 5), isNotNull);
      expect(validatePassword('ab', minLength: 5), contains('mínimo 5'));
    });
  });
}
