import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc_bloc.dart';
 
void main() {

  blocTest<BlocBloc, int>('emits [1] when increment is added',
    build: () => BlocBloc(),
    act: (bloc) => bloc.add(BlocEvent.increment),
    expect: () => [1],
  );
}