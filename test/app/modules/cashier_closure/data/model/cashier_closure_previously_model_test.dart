import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CashierClosurePreviouslyModel', () {
    test('fromJson parses id and dt_record', () {
      final json = {
        'id': 42,
        'dt_record': '2025-02-24',
      };

      final model = CashierClosurePreviouslyModel.fromJson(json);

      expect(model.id, 42);
      expect(model.dtRecord, '24/02/2025');
    });

    test('toJson round-trip', () {
      final model = CashierClosurePreviouslyModel(id: 1, dtRecord: '24/02/2025');

      final json = model.toJson();
      final restored = CashierClosurePreviouslyModel.fromJson(json);

      expect(restored.id, model.id);
      expect(restored.dtRecord, model.dtRecord);
    });
  });
}
