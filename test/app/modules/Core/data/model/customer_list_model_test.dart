import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomerListModel', () {
    test('fromJson parses all fields', () {
      final json = {
        'id': 42,
        'name_company': 'Empresa LTDA',
        'nick_trade': 'Cliente X',
        'doc_kind': 'CNPJ',
        'doc_number': '12345678000199',
        'street': 'Rua A',
        'nmbr': '100',
        'complement': 'Sala 2',
        'error': '',
      };

      final model = CustomerListModel.fromJson(json);

      expect(model.id, 42);
      expect(model.nameCompany, 'Empresa LTDA');
      expect(model.nickTrade, 'Cliente X');
      expect(model.docKind, 'CNPJ');
      expect(model.docNumber, '12345678000199');
      expect(model.street, 'Rua A');
      expect(model.nmbr, '100');
      expect(model.complement, 'Sala 2');
      expect(model.error, '');
    });

    test('fromJson uses defaults for null/missing fields', () {
      final model = CustomerListModel.fromJson({});

      expect(model.id, 0);
      expect(model.nameCompany, '');
      expect(model.nickTrade, '');
      expect(model.docKind, '');
      expect(model.docNumber, '');
      expect(model.street, '');
      expect(model.nmbr, '');
      expect(model.complement, '');
      expect(model.error, '');
    });

    test('constructor uses defaults for null params', () {
      final model = CustomerListModel();

      expect(model.id, 0);
      expect(model.nickTrade, '');
      expect(model.street, '');
      expect(model.nmbr, '');
      expect(model.complement, '');
    });

    test('fromJson handles id as int', () {
      final model = CustomerListModel.fromJson({'id': 10});

      expect(model.id, 10);
    });
  });
}
