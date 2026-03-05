import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClosureModel', () {
    test('isEmpty() returns model with default date and empty items', () {
      final model = ClosureModel.isEmpty();

      expect(model.items, isEmpty);
      expect(model.tbInstitutionId, 0);
      expect(model.tbUserId, 0);
      expect(model.dtRecord, isNotEmpty);
    });

    test('fromJson parses dt_record, ids and items', () {
      final json = {
        'dt_record': '2025-02-24',
        'tb_institution_id': 1,
        'tb_user_id': 2,
        'items': [
          {'description': 'Vendas', 'tag_value': 100.50, 'kind': 'S', 'color': 'blue'},
          {'description': 'Despesas', 'tag_value': 50.0, 'kind': 'D', 'color': 'red'},
        ],
      };

      final model = ClosureModel.fromJson(json);

      expect(model.dtRecord, '24/02/2025');
      expect(model.tbInstitutionId, 1);
      expect(model.tbUserId, 2);
      expect(model.items.length, 2);
      expect(model.items[0].description, 'Vendas');
      expect(model.items[0].tagValue, 100.50);
      expect(model.items[1].description, 'Despesas');
      expect(model.items[1].tagValue, 50.0);
    });

    test('toJson round-trip preserves data', () {
      final items = [
        ClosureItemsModel(description: 'A', tagValue: 10.0, kind: 'S', color: 'black'),
      ];
      final model = ClosureModel(
        dtRecord: '24/02/2025',
        tbInstitutionId: 1,
        tbUserId: 2,
        items: items,
      );

      final json = model.toJson();
      final restored = ClosureModel.fromJson(json);

      expect(restored.dtRecord, model.dtRecord);
      expect(restored.tbInstitutionId, model.tbInstitutionId);
      expect(restored.tbUserId, model.tbUserId);
      expect(restored.items.length, model.items.length);
      expect(restored.items[0].description, model.items[0].description);
      expect(restored.items[0].tagValue, model.items[0].tagValue);
    });
  });

  group('ClosureItemsModel', () {
    test('fromJson parses description and tag_value as int', () {
      final json = {
        'description': 'Total',
        'tag_value': 99,
        'kind': 'S',
        'color': 'green',
      };

      final item = ClosureItemsModel.fromJson(json);

      expect(item.description, 'Total');
      expect(item.tagValue, 99.0);
      expect(item.kind, 'S');
      expect(item.color, 'green');
    });

    test('fromJson parses tag_value as double', () {
      final json = {
        'description': 'Valor',
        'tag_value': 123.45,
        'kind': null,
        'color': null,
      };

      final item = ClosureItemsModel.fromJson(json);

      expect(item.tagValue, 123.45);
      expect(item.kind, '');
      expect(item.color, 'black');
    });

    test('toJson round-trip', () {
      final item = ClosureItemsModel(
        description: 'Test',
        tagValue: 42.5,
        kind: 'K',
        color: 'red',
      );

      final json = item.toJson();
      final restored = ClosureItemsModel.fromJson(json);

      expect(restored.description, item.description);
      expect(restored.tagValue, item.tagValue);
      expect(restored.kind, item.kind);
      expect(restored.color, item.color);
    });
  });
}
