import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';

abstract class LineBusinessState {
  List<LineBusinessModel> lineBusinessList;

  LineBusinessState({
    required this.lineBusinessList,
  });
}

class LineBusinessInitialState extends LineBusinessState {
  LineBusinessInitialState() : super(lineBusinessList: []);
}

class LineBusinessSuccessState extends LineBusinessState {
  LineBusinessSuccessState({
    required List<LineBusinessModel> lineBusinessList,
  }) : super(lineBusinessList: lineBusinessList);
}

class LineBusinessEditSuccessState extends LineBusinessState {
  LineBusinessEditSuccessState(
      {required List<LineBusinessModel> lineBusinessList})
      : super(lineBusinessList: lineBusinessList);
}

class LineBusinessAddSuccessState extends LineBusinessState {
  LineBusinessAddSuccessState(
      {required List<LineBusinessModel> lineBusinessList})
      : super(lineBusinessList: lineBusinessList);
}

class LineBusinessPutErrorState extends LineBusinessState {
  LineBusinessPutErrorState({required List<LineBusinessModel> lineBusinessList})
      : super(lineBusinessList: lineBusinessList);
}

class LineBusinessAddErrorState extends LineBusinessState {
  LineBusinessAddErrorState({required List<LineBusinessModel> lineBusinessList})
      : super(lineBusinessList: lineBusinessList);
}

class LineBusinessErrorState extends LineBusinessState {
  LineBusinessErrorState() : super(lineBusinessList: []);
}

class LineBusinessDeleteSuccessState extends LineBusinessState {
  LineBusinessDeleteSuccessState(
      {required List<LineBusinessModel> lineBusinessList})
      : super(lineBusinessList: lineBusinessList);
}

class LineBusinessDeleteErrorState extends LineBusinessState {
  LineBusinessDeleteErrorState(
      {required List<LineBusinessModel> lineBusinessList})
      : super(lineBusinessList: lineBusinessList);
}

class LineBusinessInterationPageState extends LineBusinessState {
  final LineBusinessModel? lineBusiness;
  LineBusinessInterationPageState({
    required List<LineBusinessModel> lineBusinessList,
    this.lineBusiness,
  }) : super(lineBusinessList: lineBusinessList);
}
