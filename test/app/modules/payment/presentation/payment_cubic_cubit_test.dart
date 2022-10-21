import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:appweb/app/modules/payment/presentation/payment_cubic/payment_cubic_cubit.dart';
 
void main() {

  blocTest<PaymentCubicCubit, int>('emits [1] when increment is added',
    build: () => PaymentCubicCubit(),
    act: (cubit) => cubit.increment(),
    expect: () => [1],
  );
}