import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_bloc.dart';
 
void main() {

  blocTest<LineBusinessBloc, int>('emits [1] when increment is added',
    build: () => LineBusinessBloc(),
    act: (bloc) => bloc.add(LineBusinessEvent.increment),
    expect: () => [1],
  );
}